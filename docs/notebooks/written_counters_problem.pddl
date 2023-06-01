(define (problem robot-problem)
 (:domain robot-domain)
 (:objects
   l0 l1 l2 l3 l4 l5 l6 l7 l8 l9 - location
 )
 (:init (robot_at l0) (connected l0 l1) (connected l1 l2) (connected l2 l3) (connected l3 l4) (connected l4 l5) (connected l5 l6) (connected l6 l7) (connected l7 l8) (connected l8 l9))
 (:goal (and (robot_at l9) (robot_at l9) (robot_at l9)))
)
