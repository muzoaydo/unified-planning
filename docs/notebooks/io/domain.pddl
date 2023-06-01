(define (domain task-planning)
  (:requirements :strips :typing :durative-actions)
  (:types
    team task machine
  )
  (:predicates
    (belongs ?t - task ?m - machine)
    (assignable ?t - task ?team - team)
    (completed ?t - task)
    (in-progress ?t - task)
    (team-busy ?team - team)
  )
  (:functions
    (total-cost)
    (task-duration ?t - task)
    (task-cost ?t - task)
    (total-time)
  )
  (:durative-action assign
    :parameters (?t - task ?team - team ?m - machine)
    :duration (= ?duration (task-duration ?t))
    :condition (and
      (at start (assignable ?t ?team))
      (at start (belongs ?t ?m))
      (at start (not (completed ?t)))
      (at start (not (in-progress ?t)))
      (at start (not (team-busy ?team)))
      (over all (<= (+ (total-time) ?duration) 24))
    )
    :effect (and
      (at start (in-progress ?t))
      (at start (team-busy ?team))
      (at end (completed ?t))
      (at end (not (in-progress ?t)))
      (at end (not (team-busy ?team)))
      (at end(increase(total-cost)(task-cost?t)))
      (at end(increase(total-time)?duration))
    )
  )
)
; (define (domain maintenance)
;   (:requirements :strips :typing)
;   (:types machine)
;   ;; Predicates
;   (:predicates
;     (at ?m - machine ?t - time)
;     (maintained ?m - machine)
;   )
;   ;; Actions
;   (:action schedule-maintenance
;     :parameters (?m - machine ?t - time)
;     :precondition (at ?m ?t)
;     :effect (and (maintained ?m)
;       (at ?m (+ ?t (duration ?m))))
;   )
;   ;; Durations
;   (:durative-action perform-maintenance
;     :parameters (?m - machine)
;     :duration (duration ?m)
;     :condition (and (maintained ?m)
;       (at start (not (maintained ?m))))
;     :effect (and (at end (maintained ?m))
;       (at end (not (at ?m ?t))))
;   )
;   ;; Initial state
;   (:init
;     ;; Machine 1
;     (at machine1 0)
;     (duration machine1 10)
;     ;; Machine 2
;     (at machine2 0)
;     (duration machine2 15)
;     ;; Machine 3
;     (at machine3 0)
;     (duration machine3 20)
;     ;; Machine 4
;     (at machine4 0)
;     (duration machine4 30)
;     ;; Machine 5
;     (at machine5 0)
;     (duration machine5 60)
;     ;; Machine 6
;     (at machine6 0)
;     (duration machine6 100)
;     ;; Machine 7
;     (at machine7 0)
;     (duration machine7 45)
;     ;; Machine 8
;     (at machine8 0)
;     (duration machine8 60)
;   )
; )

; (define (domain maintenance)
  ;     (:requirements :strips :typing)
  ;     (:types task machine team)
  ;     (:predicates
  ;         (assigned ?task - task ?team - team)
  ;         (related ?task - task ?machine - machine)
  ;         (completed ?task - task)
  ;         (pending ?task - task)
  ;         (canceled ?task - task)
  ;         (in-progress ?task - task)
  ;     )
  ;     (:action assignn
  ;         :parameters (?task - task ?team - team)
  ;         :precondition (and (not (assigned ?task ?team)) (not (completed ?task)))
  ;         :effect (assigned ?task ?team)
  ;     )
  ;     (:action complete
  ;         :parameters (?task - task)
  ;         :precondition (and (not (completed ?task)) (or (assigned ?task) (in-progress ?task)))
  ;         :effect (and (completed ?task) (not (in-progress ?task)))
  ;     )
  ;     (:action cancel
  ;         :parameters (?task - task)
  ;         :precondition (and (not (canceled ?task)) (not (completed ?task)))
  ;         :effect (canceled ?task)
  ;     )
  ;     (:action start
  ;         :parameters (?task - task)
  ;         :precondition (and (not (in-progress ?task)) (assigned ?task))
  ;         :effect (and (in-progress ?task) (not (assigned ?task)))
  ;     )
  ; )

  ; (define (domain task-planning)
  ;   (:requirements :strips :typing :durative-actions)
  ;   (:types team task machine)
  ;   (:predicates
  ;     (belongs ?t - task ?m - machine)
  ;     (assignable ?t - task ?team - team)
  ;     (completed ?t - task)
  ;   )
  ;   (:durative-action assignn
  ;     :parameters (?t - task ?team - team ?m - machine)
  ;     :duration (= ?duration (task-duration ?t))
  ;     :condition (and
  ;       (at start (assignable ?t ?team))
  ;       (at start (belongs ?t ?m))
  ;       (over all (not (completed ?t)))
  ;     )
  ;     :effect (and
  ;       (at end (completed ?t))
  ;       (at end (increase (total-cost) (task-cost ?t)))
  ;     )
  ;   )
  ; )