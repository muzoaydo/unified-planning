(define (problem task-assignment)
  (:domain task-assignment)
  (:objects
    t1 t2 t3 - team
    task1 task2 task3 task4 - task
  )

  ;; Initial state
  (:init
    (team-available t1)
    (team-available t2)
    (team-available t3)

    (task-duration task1 4)
    (task-duration task2 6)
    (task-duration task3 8)
    (task-duration task4 10)

    (task-action-cost task1 2)
    (task-action-cost task2 3)
    (task-action-cost task3 4)
    (task-action-cost task4 5)

    (task-over-24-hours task4)
  )

  ;; Goal state
  (:goal (and
    (forall (?task - task) (task-assigned ?task))
    (forall (?team - team)
      (imply (team-performs-task ?team ?task) (task-assigned ?task))
    )
  ))

  ;; Metric
  (:metric minimize (total-action-cost))
)
