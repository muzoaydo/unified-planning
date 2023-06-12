(define (domain task-assignment)
  (:requirements :strips :typing)
  (:types
    task team - object
  )

  ;; Predicates
  (:predicates
    (task-assigned ?task - task)
    (team-available ?team - team)
    (team-performs-task ?team - team ?task - task)
    (task-duration ?task - task ?duration - number)
    (task-action-cost ?task - task ?cost - number)
    (task-over-24-hours ?task - task)
  )

  ;; Actions
  (:action assign-task
    :parameters (?team - team ?task - task)
    :precondition (and (team-available ?team) (task-over-24-hours ?task))
    :effect (and
      (team-performs-task ?team ?task)
      (not (team-available ?team))
      (not (task-over-24-hours ?task))
      (increase
        (total-action-cost)
        (task-action-cost ?task))
    )
  )

  ;; Durative actions
  (:durative-action perform-task
    :parameters (?team - team ?task - task)
    :duration (task-duration ?task)
    :condition (and (team-performs-task ?team ?task) (at start (team-available ?team)))
    :effect (and
      (not (team-available ?team))
      (not (team-performs-task ?team ?task))
      (at end (team-available ?team))
    )
  )

  ;; Functions
  (:functions
    (total-action-cost) - number
  )
)