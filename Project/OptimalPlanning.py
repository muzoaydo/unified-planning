from unified_planning.shortcuts import *
from unified_planning.engines import PlanGenerationResultStatus

# basic with actions cost
x = Fluent("x")
y = Fluent("y")

a = InstantaneousAction("t")
a.add_precondition(Not(x))
a.add_effect(x, True)

b = InstantaneousAction("b")
b.add_precondition(Not(y))
b.add_effect(y, True)

c = InstantaneousAction("c")
c.add_precondition(y)
c.add_effect(x, True)

problem = Problem("simple_with_costs")

problem.add_fluent(x)
problem.add_fluent(y)

problem.add_action(a)
problem.add_action(b)
problem.add_action(c)

problem.set_initial_value(x, False)
problem.set_initial_value(y, False)

problem.add_goal(x)

problem.add_quality_metric(
    up.model.metrics.MinimizeActionCosts({a: 10, b: 1, c: 1})
)

expected_plan = up.plans.SequentialPlan(
    [up.plans.ActionInstance(b), up.plans.ActionInstance(c)]
)
print(problem)
with OneshotPlanner(
    problem_kind=problem.kind,
    optimality_guarantee=PlanGenerationResultStatus.SOLVED_OPTIMALLY,
) as planner:
    final_report = planner.solve(problem)
    print(f"final_report:{final_report}")
    plan = final_report.plan
    print(f"plan:{plan}")
    print(plan)

# assert final_report.status == PlanGenerationResultStatus.SOLVED_OPTIMALLY
# assert plan == expected_plan

# problem.clear_quality_metrics()
# problem.add_quality_metric(up.model.metrics.MinimizeSequentialPlanLength())

# with OneshotPlanner(
#     problem_kind=problem.kind,
#     optimality_guarantee=PlanGenerationResultStatus.SOLVED_OPTIMALLY,
# ) as planner:
#     final_report = planner.solve(problem)
#     plan = final_report.plan
#     expected_plan = up.plans.SequentialPlan(
#     [up.plans.ActionInstance(a)]
# )
# # assert final_report.status == PlanGenerationResultStatus.SOLVED_OPTIMALLY
# # assert plan == expected_plan
# print(plan)


# expected_plan = up.plans.SequentialPlan(
#     [up.plans.ActionInstance(a)]
# )
# # assert final_report.status == PlanGenerationResultStatus.SOLVED_OPTIMALLY
# # assert plan == expected_plan
# print(plan)