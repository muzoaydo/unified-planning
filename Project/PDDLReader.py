from unified_planning.io import PDDLReader, PDDLWriter

reader = PDDLReader()
pddl_problem = reader.parse_problem('C:/Users/muzo1/Desktop/UPF/unified-planning/Project/PDDLs/domain2.pddl', 'C:/Users/muzo1/Desktop/UPF/unified-planning/Project/PDDLs/problem2.pddl')
print(pddl_problem)