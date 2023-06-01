(define (problem maintenance-problem)
  (:domain maintenance)
  (:objects
    machine1 machine2 machine3 machine4 machine5 machine6 machine7 machine8 - machine
  )
  ;; Goal
  (:goal (forall (?m - machine)
    (maintained ?m)))
)




; (define(problem task-problem)
; (:domain task-planning)
; (:objects
; team1 team2 team3 team4 - team
; task1 task2 task3 task4 task5 task6 task7 task8 - task
; machine1 machine2 machine3 - machine
; )
; (:init
; (= (total-cost) 0)
; (= (total-time) 0)

; (= (task-duration task1) 2)
; (= (task-duration task2) 3)
; (=(task-duration task3)1)
; (=(task-duration task4)4)
; (=(task-duration task5)2)
; (=(task-duration task6)3)
; (=(task-duration task7)1)
; (=(task-duration task8)4)

; (= (task-cost task1) 10)
; (= (task-cost task2) 20)
; (=(task-cost task3)30)
; (=(task-cost task4)40)
; (=(task-cost task5)50)
; (=(task-cost task6)60)
; (=(task-cost task7)70)
; (=(task-cost task8)80)

; (belongs task1 machine1)
; (belongs task2 machine1)
; (belongs task3 machine2)
; (belongs task4 machine2)
; (belongs task5 machine3)
; (belongs task6 machine3)
; (belongs task7 machine1)
; (belongs task8 machine2)

; (assignable task1 team1)
; (assignable task2 team1)
; (assignable task3 team2)
; (assignable task4 team2)
; (assignable task5 team3)
; (assignable task6 team3)
; (assignable task7 team4)
; (assignable task8 team4)
; )
; (:goal (and
; (completed task1)
; (completed task2)
; (completed task3)
; (completed task4)
; (completed task5)
; (completed task6)
; (completed task7)
; (completed task8)
; ))
; (:metric minimize (total-cost))
; )

; (define (problem task-problem)
;   (:domain task-planning)
;   (:objects
;     team1 team2 team3 team4 - team
;     task1 task2 task3 task4 task5 task6 task7 task8 - task
;     machine1 machine2 machine3 - machine
;   )
;   (:init
;     (= (total-cost) 0)
;     (= (task-duration task1) 2)
;     (= (task-duration task2) 3)
;     (= (task-duration task3) 1)
;     (= (task-duration task4) 4)
;     (= (task-duration task5) 2)
;     (= (task-duration task6) 3)
;     (= (task-duration task7) 1)
;     (= (task-duration task8) 4)

;     (= (task-cost task1) 10)
;     (= (task-cost task2) 20)
;     (= (task-cost task3) 30)
;     (= (task-cost task4) 40)
;     (= (task-cost task5) 50)
;     (= (task-cost task6) 60)
;     (= (task-cost task7) 70)
;     (= (task-cost task8) 80)

;     ; tasks belong to machines
;     (belongs task1 machine1)
;     (belongs task2 machine1)
;     (belongs task3 machine2)
;     (belongs task4 machine2)
;     (belongs task5 machine3)
;     (belongs task6 machine3)
;     (belongs task7 machine1)
;     (belongs task8 machine2)

;     ; tasks are assignable to teams
;     (assignable task1 team1)
;     (assignable task2 team1)
;     (assignable task3 team2)
;     (assignable task4 team2)
;     (assignable task5 team3)
;     (assignable task6 team3)
;     (assignable task7 team4)
;     (assignable task8 team4)
;   )
;   (:goal (and
;     (completed task1)
;     (completed task2)
;     (completed task3)
;     (completed task4)
;     (completed task5)
;     (completed task6)
;     (completed task7)
;     (completed task8)
;   ))
;   (:metric minimize (total-cost))
; )



; (define (problem maintenance-planning)
;     (:domain maintenance)
;     (:objects
;         machine1 machine2 machine3 machine4 - machine
;         team1 team2 team3 - team
;         task1 task2 task3 task4 task5 task6 task7 task8 - task
;     )
;     (:init
;         ; relationships between tasks and machines
;         (related task1 machine1)
;         (related task2 machine2)
;         (related task3 machine3)
;         (related task4 machine4)
        
;         ; initial status of tasks
;         (pending task1)
;         (pending task2)
;         (pending task3)
;         (pending task4)
;     )
;     (:goal 
;       ; specify the goal state here
;       ; for example, to complete all tasks with minimum cost:
;       (and 
;         (forall (?t - task) 
;           (completed ?t))
;       )
;     )
;     (:metric minimize (total-cost))
; )