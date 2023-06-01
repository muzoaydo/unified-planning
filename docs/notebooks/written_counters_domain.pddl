(define (domain robot-domain)
 (:requirements :strips :typing)
 (:types location)
 (:predicates (robot_at ?l - location) (connected ?l_from - location ?l_to - location))
 (:action move
  :parameters ( ?l_from - location ?l_to - location)
  :precondition (and (connected ?l_from ?l_to) (robot_at ?l_from))
  :effect (and (not (robot_at ?l_from)) (robot_at ?l_to)))
)
