;It's recommended to install the misc-pddl-generators plugin 
;and then use Network generator to create the graph
(define (problem p3-UpdsideDown)
  (:domain UpdsideDown)
  (:objects
    cell-1 cell-2 cell-3 cell-4 cell-5 cell-6 cell-7 cell-8 cell-9 cell-10 cell-11 cell-12 cell-13 - cells
    red green blue - colour
    m1 - matches
    k1 k2 k3 - keys
  )
  (:init
    ;Initial Hero Location
    (at cell-1)
    ;She starts with a free arm
    (hands-free)
    ;Initial location of the keys
    (key-in k1 cell-9)
    (key-in k2 cell-5)
    (key-in k3 cell-12)
    ;Initial location of the matches
    (match-in m1 cell-5)
    ;Initial location of Monsters
    (monster-in cell-11)
    ;Initial lcocation of open gates
    (door cell-2 red)
    (door cell-3 red)
    (door cell-8 red)
    (door cell-10 red)
    (door cell-7 red)
    (door cell-4 green)
    (door cell-6 green)
    (door cell-12 blue)
    ;Key uses
    (key-infinite-uses k1)
    (key-two-use k2)
    (key-one-use k3)
    ;Key Colours
    (key-c k1 red)
    (key-c k2 green)
    (key-c k3 blue)
    ;Graph Connectivity
    (connected cell-1 cell-2)
    (connected cell-1 cell-8)
    (connected cell-2 cell-3)
    (connected cell-2 cell-9)
    (connected cell-8 cell-3)
    (connected cell-8 cell-9)
    (connected cell-3 cell-4)
    (connected cell-3 cell-10)
    (connected cell-9 cell-4)
    (connected cell-9 cell-10)
    (connected cell-4 cell-5)
    (connected cell-4 cell-11)
    (connected cell-10 cell-5)
    (connected cell-10 cell-11)
    (connected cell-5 cell-6)
    (connected cell-5 cell-12)
    (connected cell-11 cell-6)
    (connected cell-11 cell-12)
    (connected cell-6 cell-7)
    (connected cell-6 cell-13)
    (connected cell-12 cell-7)
    (connected cell-12 cell-13)
  )
  (:goal (and
    ;Hero's Goal Location
    (at cell-13)
    ;All gates are closed
    (door-closed cell-2)
    (door-closed cell-3)
    (door-closed cell-4)
    (door-closed cell-6)
    (door-closed cell-7)
    (door-closed cell-8)
    (door-closed cell-10)
    (door-closed cell-12)
  )
  )
)