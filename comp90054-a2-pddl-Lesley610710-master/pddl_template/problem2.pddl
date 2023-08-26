;It's recommended to install the misc-pddl-generators plugin 
;and then use Network generator to create the graph
(define (problem p2-UpdsideDown)
  (:domain UpdsideDown)
  (:objects
    cell-1 cell-2 cell-3 cell-4 cell-5 cell-6 cell-7 cell-8 cell-9 cell-10 cell-11 cell-12 cell-13 cell-14 cell-15 - cells
    red green blue - colour
    m1 m2 - matches
    k1 k2 - keys
  )
  (:init
    ;Initial Hero Location
    (at cell-1)
    ;She starts with a free arm
    (hands-free)
    ;Initial location of the keys
    (key-in k1 cell-1)
    (key-in k2 cell-11)
    ;Initial location of the matches
    (match-in m1 cell-6)
    (match-in m2 cell-13)
    ;Initial location of Monsters
    (monster-in cell-14)
    ;Initial lcocation of open gates
    (door cell-2 red)
    (door cell-3 red)
    (door cell-4 red)
    (door cell-5 red)
    (door cell-7 red)
    (door cell-8 red)
    (door cell-9 red)
    (door cell-10 red)
    (door cell-12 green)
    ;Key uses
    (key-infinite-uses k1)
    (key-two-use k2)
    ;Key Colours
    (key-c k1 red)
    (key-c k2 green)
    ;Graph Connectivity
    (connected cell-2 cell-5)
    (connected cell-5 cell-8)
    (connected cell-2 cell-3)
    (connected cell-2 cell-6)
    (connected cell-5 cell-6)
    (connected cell-8 cell-6)
    (connected cell-8 cell-9)
    (connected cell-1 cell-3)
    (connected cell-3 cell-6)
    (connected cell-6 cell-9)
    (connected cell-9 cell-11)
    (connected cell-3 cell-4)
    (connected cell-6 cell-4)
    (connected cell-6 cell-7)
    (connected cell-6 cell-10)
    (connected cell-9 cell-10)
    (connected cell-11 cell-12)
    (connected cell-4 cell-7)
    (connected cell-7 cell-10)
    (connected cell-12 cell-13)
    (connected cell-13 cell-14)
    (connected cell-14 cell-15)
  )
  (:goal (and
    ;Hero's Goal Location
    (at cell-15)
    ;All gates are closed
    (door-closed cell-2)
    (door-closed cell-3)
    (door-closed cell-4)
    (door-closed cell-5)
    (door-closed cell-7)
    (door-closed cell-8)
    (door-closed cell-9)
    (door-closed cell-10)
    (door-closed cell-12)
  )
  )
)
