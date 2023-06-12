(define (problem monkey-banana-problem)
  (:domain monkey-banana)
  (:objects
    monkey - object
    box - object
    bananas - object
    knife - object
    water-glass - object
    tap - position
    P1 - position
    P2 - position
    P3 - position
    P4 - position
    P5 - position
    P6 - position
  )
  (:init
    (at monkey P1)
    (at box P2)
    (at bananas P3)
    (at knife P4)
    (at water-glass P5)
    (box-at P2)
    (water-glass-at P5)
    (banana-at P3)
    (knife-at P4)
    (height monkey low)
    (height box low)
    (height bananas high)
    (height knife low)
    (height water-glass high)
  )
  (:goal
    (and
      (orderly-room)
      (not (at box P2))
      (not (at knife P4))
    )
  )
)
