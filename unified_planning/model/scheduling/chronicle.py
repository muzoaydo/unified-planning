from typing import Optional, List, OrderedDict, Union

import unified_planning as up
from unified_planning import Environment
from unified_planning.model import Parameter
from unified_planning.model.mixins.timed_conds_effs import TimedCondsEffs
from unified_planning.model.types import Type


class Chronicle(TimedCondsEffs):
    """Core structure to represent a set of timed conditions and effects."""

    def __init__(
        self,
        name: str,
        _parameters: Optional["OrderedDict[str, up.model.types.Type]"] = None,
        _env: Optional[Environment] = None,
        **kwargs: "up.model.types.Type",
    ):
        TimedCondsEffs.__init__(self, _env)
        self._name = name
        self._constraints: List["up.model.fnode.FNode"] = []
        self._parameters: "OrderedDict[str, up.model.parameter.Parameter]" = (
            OrderedDict()
        )

        if _parameters is not None:
            assert len(kwargs) == 0
            for n, t in _parameters.items():
                assert self._environment.type_manager.has_type(
                    t
                ), "type of parameter does not belong to the same environment of the action"
                self._parameters[n] = up.model.parameter.Parameter(
                    n, t, self._environment
                )
        else:
            for n, t in kwargs.items():
                assert self._environment.type_manager.has_type(
                    t
                ), "type of parameter does not belong to the same environment of the action"
                self._parameters[n] = up.model.parameter.Parameter(
                    n, t, self._environment
                )

    def __repr__(self) -> str:
        s = []
        s.append(f"{self.name}")
        first = True
        for p in self.parameters:
            if first:
                s.append("(")
                first = False
            else:
                s.append(", ")
            s.append(str(p))
        if not first:
            s.append(")")
        s.append(" {\n")
        if len(self._constraints) > 0:
            s.append("    constraints = [\n")
            for c in self._constraints:
                s.append(f"      {str(c)}\n")
            s.append("    ]\n")
        if len(self.conditions) > 0:
            s.append("    conditions = [\n")
            for i, cl in self.conditions.items():
                s.append(f"      {str(i)}:\n")
                for c in cl:
                    s.append(f"        {str(c)}\n")
            s.append("    ]\n")
        if len(self.effects) > 0:
            s.append("    effects = [\n")
            for t, el in self.effects.items():
                s.append(f"      {str(t)}:\n")
                for e in el:
                    s.append(f"        {str(e)}:\n")
            s.append("    ]\n")
        s.append("  }")
        return "".join(s)

    def __eq__(self, oth: object) -> bool:
        if not isinstance(oth, Chronicle):
            return False
        if (
            self._environment != oth._environment
            or self._parameters != oth._parameters
            or self._name != oth._name
        ):
            return False
        if set(self._constraints) != set(oth._constraints):
            return False
        if not TimedCondsEffs.__eq__(self, oth):
            return False
        return True

    def __hash__(self) -> int:
        res = hash(self._name)
        res += sum(map(hash, self._parameters.items()))
        res += sum(map(hash, self._constraints))
        res += TimedCondsEffs.__hash__(self)
        return res

    @property
    def name(self) -> str:
        """Returns the `Chronicle` `name`."""
        return self._name

    def clone(self):
        new = Chronicle(self._name, _env=self._environment)
        new._parameters = self._parameters.copy()
        new._constraints = self._constraints.copy()
        TimedCondsEffs._clone_to(self, new)
        return new

    def add_parameter(self, name: str, tpe: Type) -> Parameter:
        """Adds a new decision variable associated to this activity.
        The resulting parameter's identifier will be prefixed with the activity's name but may be
        used outside the activity itself. For instance, it could appear in global constraints or
        constraints involving more than one activity."""
        assert ":" not in name, f"Usage of ':' is forbidden in names: {name}"
        scoped_name = f"{self.name}:{name}"
        if name in self._parameters:
            raise ValueError(f"Name '{name}' already used in chronicle '{self.name}'")
        param = Parameter(scoped_name, tpe)
        self._parameters[name] = param
        return param

    @property
    def parameters(self) -> List["up.model.parameter.Parameter"]:
        """Returns the `list` of the `Action parameters`."""
        return list(self._parameters.values())

    def add_constraint(
        self,
        constraint: Union[
            "up.model.fnode.FNode",
            "up.model.fluent.Fluent",
            "up.model.parameter.Parameter",
            bool,
        ],
    ):
        """
        Adds the given expression to the `chronicle's constraints`.
        """
        (constraint_exp,) = self._environment.expression_manager.auto_promote(
            constraint
        )
        assert self._environment.type_checker.get_type(constraint_exp).is_bool_type()
        if constraint_exp not in self._constraints:
            self._constraints.append(constraint_exp)
