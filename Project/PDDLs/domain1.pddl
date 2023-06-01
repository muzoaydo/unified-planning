(define (domain task-planning)
  (:requirements :strips :typing)
  
  (:types
    task - object
    action - object
  )
  
  (:predicates
    (task-assigned ?task - task)
    (task-unassigned ?task - task)
    (action-available ?action - action)
    (action-started ?action - action)
    (action-completed ?action - action)
  )
  
  (:functions
    (action-cost ?action - action)
    (action-duration ?action - action)
    (total-cost)
  )
  
  (:action assign-task
    :parameters (?task - task ?action - action)
    :precondition (and 
      (task-unassigned ?task)
      (action-available ?action)
    )
    :effect (and 
      (not (task-unassigned ?task))
      (task-assigned ?task)
      (not (action-available ?action))
      (action-started ?action)
      (increase (total-cost) (action-cost ?action))
    )
  )
  
  (:action complete-action
    :parameters (?action - action)
    :precondition (and 
      (action-started ?action)
      (not (action-completed ?action))
    )
    :effect (and 
      (action-completed ?action)
    )
  )
  
  (:action wait
    :parameters (?action - action)
    :precondition (and 
      (action-started ?action)
      (not (action-completed ?action))
    )
    :effect (and 
      (not (action-started ?action))
    )
  )
  
)