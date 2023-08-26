;It's recommended to install the misc-pddl-generators plugin 
;and then use Network generator to create the graph
(define (problem p4-UpdsideDown)
  (:domain UpdsideDown)
  (:objects
    ;add objects and their types
    cell-1 cell-2 cell-3 cell-4 cell-5 cell-6 cell-7 - cells
    red green blue - colour
    k1 k2 k3 - keys
  )
  (:init
    ;Initial Hero Location
    (at cell-1)
    ;He starts with a free arm
    (hands-free)
    ;Initial location of the keys
    (key-in k1 cell-1)
    (key-in k2 cell-3)
    (key-in k3 cell-5)
    ;Initial lcocation of open gates
    (door cell-2 red)
    (door cell-4 green)
    (door cell-6 blue)
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
    (connected cell-2 cell-3)
    (connected cell-3 cell-4)
    (connected cell-4 cell-5)
    (connected cell-5 cell-6)
    (connected cell-6 cell-7)
  )
  (:goal (and
    ;Hero's Goal Location
    (at cell-7)
    ;All gates are closed
    (door-closed cell-2)
    (door-closed cell-4)
    (door-closed cell-6)
    )
  )
)
