;It's recommended to install the misc-pddl-generators plugin 
;and then use Network generator to create the graph
(define (problem p1-UpdsideDown)
  (:domain UpdsideDown)
  (:objects
    cell-1 cell-2 cell-3 cell-4 cell-5 cell-6 cell-7 cell-8 cell-9 cell-10 cell-11 - cells
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
    (key-in k1 cell-2)
    (key-in k2 cell-8)
    (key-in k3 cell-10)
    ;Initial location of the matches
    (match-in m1 cell-4)
    ;Initial location of Monsters
    (monster-in cell-3)
    ;Initial lcocation of open gates
    (door cell-5 red)
    (door cell-6 green)
    (door cell-9 green)
    (door cell-7 blue)
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
    (connected cell-2 cell-5)
    (connected cell-5 cell-8)
    (connected cell-2 cell-3)
    (connected cell-5 cell-6)
    (connected cell-8 cell-9)
    (connected cell-11 cell-3)
    (connected cell-3 cell-6)
    (connected cell-6 cell-9)
    (connected cell-3 cell-4)
    (connected cell-6 cell-7)
    (connected cell-9 cell-10)
    (connected cell-4 cell-7)
    (connected cell-7 cell-10)
  )
  (:goal (and
        ;Hero's Goal Location
        (at cell-11)
        ;All gates are closed
        (door-closed cell-5)
        (door-closed cell-6)
        (door-closed cell-9)
        (door-closed cell-7)
        )
  )
)