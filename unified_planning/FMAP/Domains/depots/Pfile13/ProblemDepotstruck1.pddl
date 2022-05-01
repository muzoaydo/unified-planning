(define (problem depotprob5646)
(:domain depot)
(:objects
 depot0 depot1 depot2 - depot
 distributor0 distributor1 distributor2 - distributor
 truck0 truck1 - truck
 crate0 crate1 crate2 crate3 crate4 crate5 - crate
 pallet0 pallet1 pallet2 pallet3 pallet4 pallet5 pallet6 pallet7 pallet8 pallet9 - pallet
 hoist0 hoist1 hoist2 hoist3 hoist4 hoist5 - hoist
)
(:shared-data
  (clear ?x - (either surface hoist))
  ((at ?t - truck) - place)
  ((pos ?c - crate) - (either place truck))
  ((on ?c - crate) - (either surface hoist truck)) - 
(either depot0 depot1 depot2 distributor0 distributor1 distributor2 truck0)
)
(:init
 (myAgent truck1)
 (= (pos crate0) depot2)
 (not (clear crate0))
 (= (on crate0) pallet2)
 (= (pos crate1) depot2)
 (not (clear crate1))
 (= (on crate1) crate0)
 (= (pos crate2) depot0)
 (clear crate2)
 (= (on crate2) pallet0)
 (= (pos crate3) depot0)
 (clear crate3)
 (= (on crate3) pallet8)
 (= (pos crate4) distributor0)
 (clear crate4)
 (= (on crate4) pallet3)
 (= (pos crate5) depot2)
 (clear crate5)
 (= (on crate5) crate1)
 (= (at truck0) distributor1)
 (= (at truck1) depot0)
 (= (located hoist0) depot0)
 (clear hoist0)
 (= (located hoist1) depot1)
 (clear hoist1)
 (= (located hoist2) depot2)
 (clear hoist2)
 (= (located hoist3) distributor0)
 (clear hoist3)
 (= (located hoist4) distributor1)
 (clear hoist4)
 (= (located hoist5) distributor2)
 (clear hoist5)
 (= (placed pallet0) depot0)
 (not (clear pallet0))
 (= (placed pallet1) depot1)
 (clear pallet1)
 (= (placed pallet2) depot2)
 (not (clear pallet2))
 (= (placed pallet3) distributor0)
 (not (clear pallet3))
 (= (placed pallet4) distributor1)
 (clear pallet4)
 (= (placed pallet5) distributor2)
 (clear pallet5)
 (= (placed pallet6) distributor1)
 (clear pallet6)
 (= (placed pallet7) depot0)
 (clear pallet7)
 (= (placed pallet8) depot0)
 (not (clear pallet8))
 (= (placed pallet9) distributor0)
 (clear pallet9)
)
(:global-goal (and
 (= (on crate0) pallet0)
 (= (on crate1) pallet5)
 (= (on crate2) pallet4)
 (= (on crate3) pallet7)
 (= (on crate4) pallet9)
 (= (on crate5) pallet1)
))
)