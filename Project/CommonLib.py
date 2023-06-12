from unified_planning.io import PDDLReader, PDDLWriter
import unified_planning
from unified_planning.shortcuts import *

def PDDLRead(domainPath, problemPath):
    reader = PDDLReader()
    pddl_problem = reader.parse_problem(domainPath, problemPath)
    print(pddl_problem)
    return pddl_problem

def autoSolve(problem):
    with OneshotPlanner(problem_kind=problem.kind) as planner:
        result = planner.solve(problem)
        print("%s returned: %s" % (planner.name, result.plan))

def PDDLWrite(problem):
    w = PDDLWriter(problem)
    w.write_domain('./domainOut.pddl')
    w.write_problem('./problemOut.pddl')

def PDDLPrint(problem):
    w = PDDLWriter(problem)
    w.print_domain()
    w.print_problem()

def pyperSolve(problem):
    with OneshotPlanner(name='pyperplan') as planner:
        result = planner.solve(problem)
        if result.status == up.engines.PlanGenerationResultStatus.SOLVED_SATISFICING:
            print("Pyperplan returned: %s" % result.plan)
        else:
            print("No plan found.")

def enhspSolve(problem):
    with OneshotPlanner(name='SAT-enhsp') as planner:
        result = planner.solve(problem)
        if result.status == up.engines.PlanGenerationResultStatus.SOLVED_SATISFICING:
            print("Pyperplan returned: %s" % result.plan)
        else:
            print("No plan found.")

def tamerSolve(problem):
    with OneshotPlanner(name='tamer') as planner:
        result = planner.solve(problem)
        if result.status == up.engines.PlanGenerationResultStatus.SOLVED_SATISFICING:
            print("Pyperplan returned: %s" % result.plan)
        else:
            print("No plan found.")

def parallelPlan(problem):
    with OneshotPlanner(names=['tamer', 'tamer', 'pyperplan'],
        params=[{'heuristic': 'hadd'}, {'heuristic': 'hmax'}, {}]) as planner:
        plan = planner.solve(problem).plan
        print("%s returned: %s" % (planner.name, plan))

def main(domainPath, problemPath):
    prob = PDDLRead(domainPath, problemPath)
    pyperSolve(prob)
    # autoSolve(prob)
    # parallelPlan(prob)
    # tamerSolve(prob)
    # enhspSolve(prob)

if __name__ == '__main__':
    domainPath = '/home/user/Desktop/unified-planning/Project/PDDLs/domain1.pddl'
    problemPath = '/home/user/Desktop/unified-planning/Project/PDDLs/problem1.pddl'
    main(domainPath, problemPath)


# from unified_planning.io import PDDLReader, PDDLWriter
# import unified_planning
# from unified_planning.shortcuts import *

# # Reads PDDL files and converts to Problem
# def PDDLRead(domainPath, problemPath):
#     reader = PDDLReader()
#     pddl_problem = reader.parse_problem(domainPath, problemPath)
#     print(pddl_problem)
#     return pddl_problem

# # Writes out a problem into 2 PDDL files
# def PDDLWrite(problem):
#     try:
#         w = PDDLWriter(problem)
#         w.write_domain('./domainOut.pddl')
#         w.write_problem('./problemOut.pddl')
#     except Exception as e:
#         print(f"PDDL Write Exception:")
#         print(e)

# # Prints PDDL to stdOut
# def PDDLPrint(problem):
#     try:
#         w = PDDLWriter(problem)
#         w.print_domain()
#         w.print_problem()
#     except Exception as e:
#         print("PDDL Print Exception:")
#         print(e)

# # Picks a suitable engine and tries to solve the problem.
# def autoSolve(problem):
#     try:
#         with OneshotPlanner(problem_kind=problem.kind) as planner:
#             result = planner.solve(problem)
#             print("%s returned: %s" % (planner.name, result.plan))
#     except Exception as e:
#         print("Auto Solve Exception:")
#         print(e)

# # Solves the problem with pyperplan engine
# def pyperSolve(problem):
#     try:
#         with OneshotPlanner(name='pyperplan') as planner:
#             result = planner.solve(problem)
#             if result.status == up.engines.PlanGenerationResultStatus.SOLVED_SATISFICING:
#                 print("Pyperplan returned: %s" % result.plan)
#             else:
#                 print("No plan found.")
#     except Exception as e:
#         print("Pyperplan Exception:")
#         print(e)

# # Solves the problem with SAT-enhsp engine
# def enhspSolve(problem):
#     try:
#         with OneshotPlanner(name='SAT-enhsp') as planner:
#             result = planner.solve(problem)
#             if result.status == up.engines.PlanGenerationResultStatus.SOLVED_SATISFICING:
#                 print("Pyperplan returned: %s" % result.plan)
#             else:
#                 print("No plan found.")
#     except Exception as e:
#         print("Auto Solve Exception:")
#         print(e)

# # Solves the problem with tamer engine
# def tamerSolve(problem):
#     try:
#         with OneshotPlanner(name='tamer') as planner:
#             result = planner.solve(problem)
#             if result.status == up.engines.PlanGenerationResultStatus.SOLVED_SATISFICING:
#                 print("Pyperplan returned: %s" % result.plan)
#             else:
#                 print("No plan found.")
#     except Exception as e:
#         print("Parallel Planning Exception:")
#         print(e)

# # Solves the problem with different engines on parallel
# def parallelPlan(problem):
#     try:
#         with OneshotPlanner(names=['tamer', 'tamer', 'pyperplan'],
#             params=[{'heuristic': 'hadd'}, {'heuristic': 'hmax'}, {}]) as planner:
#             plan = planner.solve(problem).plan
#             print("%s returned: %s" % (planner.name, plan))
#     except Exception as e:
#         print("Tamer Exception:")
#         print(e)

# def main(domainPath, problemPath):
#     prob = PDDLRead(domainPath, problemPath)
#     pyperSolve(prob)
#     autoSolve(prob)
#     parallelPlan(prob)
#     tamerSolve(prob)
#     enhspSolve(prob)

# # Sets the pddl locations if not imported
# if __name__ == '__main__':
#     domainPath = 'C:/Users/muzo1/Desktop/UPF/unified-planning/Project/PDDLs/domain1.pddl'
#     problemPath = 'C:/Users/muzo1/Desktop/UPF/unified-planning/Project/PDDLs/problem1.pddl'
#     main(domainPath, problemPath)

