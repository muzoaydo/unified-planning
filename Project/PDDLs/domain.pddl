(define (domain monkey-banana)
  (:requirements :strips :typing)
  (:types position)
  
  (:predicates
    (at ?obj - object ?pos - position)
    (height ?obj - object ?h - height)
    (holding ?obj - object)
    (box-at ?pos - position)
    (water-glass-at ?pos - position)
    (banana-at ?pos - position)
    (knife-at ?pos - position)
    (orderly-room)
  )

  (:functions
    (height-of ?obj - object) - height
  )

  (:action go
    :parameters (?from - position ?to - position ?obj - object)
    :precondition (and (at ?obj ?from) (box-at ?to))
    :effect (and (at ?obj ?to) (not (at ?obj ?from)))
  )

  (:action climbing
    :parameters (?monkey - object ?box - object)
    :precondition (and (at ?monkey ?box) (height ?monkey low) (height ?box low))
    :effect (and (height ?monkey high) (not (height ?box low)) (not (height ?box high)))
  )

  (:action get-down
    :parameters (?monkey - object ?box - object)
    :precondition (and (at ?monkey ?box) (height ?monkey high) (height ?box high))
    :effect (and (height ?monkey low) (not (height ?box high)) (not (height ?box low)))
  )

  (:action take-bananas
    :parameters (?monkey - object ?bananas - object ?knife - object)
    :precondition (and (at ?monkey ?bananas) (at ?knife ?monkey) (height ?monkey high) (height ?bananas high))
    :effect (and (holding ?bananas) (not (at ?bananas ?monkey)) (not (at ?bananas ?knife)))
  )

  (:action take-knife
    :parameters (?monkey - object ?knife - object)
    :precondition (and (at ?monkey ?knife) (height ?monkey high))
    :effect (and (holding ?knife) (not (at ?knife ?monkey)))
  )

  (:action grab-water-glass
    :parameters (?monkey - object ?water-glass - object)
    :precondition (and (at ?monkey ?water-glass) (height ?monkey low))
    :effect (and (holding ?water-glass) (not (at ?water-glass ?monkey)))
  )

  (:action release
    :parameters (?monkey - object ?obj - object ?pos - position ?h - height)
    :precondition (and (holding ?obj) (at ?monkey ?pos) (height ?monkey ?h))
    :effect (and (not (holding ?obj)) (at ?obj ?pos) (height ?obj ?h))
  )

  (:action push
    :parameters (?monkey - object ?box - object ?from - position ?to - position)
    :precondition (and (at ?monkey ?box) (at ?box ?from) (height ?monkey low) (height ?box low) (orderly-room))
    :effect (and (not (at ?box ?from)) (at ?box ?to))
  )

  (:action fetch-water
    :parameters (?monkey - object ?water-glass - object ?tap - position)
    :precondition (and (at ?monkey ?water-glass) (at ?tap ?monkey) (height ?monkey high))
    :effect (and (not (at ?water-glass ?tap)) (holding ?water-glass))
  )
)
