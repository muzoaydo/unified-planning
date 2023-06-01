
from unified_planning import *
from unified_planning.model.scheduling import SchedulingProblem
from unified_planning.shortcuts import *
from unified_planning.engines import PlanGenerationResultStatus

problem = SchedulingProblem("factory")
Resource = UserType("Resource")

r1 = problem.add_object("r1", Resource)
r2 = problem.add_object("r2", Resource)
problem.add_fluent("lvl", IntType(0, 1), default_initial_value=1, r=Resource)

red = problem.add_fluent("red", BoolType(), r=Resource)
problem.set_initial_value(red(r1), True)
problem.set_initial_value(red(r2), True)

workers = problem.add_resource("workers", 4)
machine1 = problem.add_resource("machine1", 1)
machine2 = problem.add_resource("machine2", 1)

a1 = problem.add_activity("a1", duration=3)
a1.uses(workers)
a1.uses(machine1)

a2 = problem.add_activity("a2", duration=6)
a2_r = a2.add_parameter("r", Resource)
problem.add_constraint(red(a2_r))
a2.uses(workers)
a2.uses(machine2)

problem.add_constraint(LT(a1.end, a2.start))

# One worker is unavailable over [17, 25)
problem.add_decrease_effect(17, workers, 1)
problem.add_increase_effect(25, workers, 1)

with OneshotPlanner(
    problem_kind=problem.kind,
    optimality_guarantee=PlanGenerationResultStatus.SOLVED_OPTIMALLY,
) as planner:
    final_report = planner.solve(problem)
    plan = final_report.plan

print(plan)