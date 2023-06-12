(define (problem task-problem)
  (:domain task-planning)
  
  (:objects
    t1 - task
    t2 - task
    t3 - task
    a1 - action
    a2 - action
    a3 - action
  )
  
  (:init
    (task-unassigned t1)
    (task-unassigned t2)
    (task-unassigned t3)
    (action-available a1)
    (action-available a2)
    (action-available a3)
    (= (total-cost) 0)
    
    ; Duration and cost of actions
    (= (action-duration a1) 4)
    (= (action-cost a1) 10)
    (= (action-duration a2) 8)
    (= (action-cost a2) 15)
    (= (action-duration a3) 12)
    (= (action-cost a3) 20)
  )
  
  (:goal (and
    (forall (?t - task) (or (task-assigned ?t) (task-unassigned ?t)))
    (forall (?a - action) (or (action-completed ?a) (not (action-started ?a))))
  ))
)