(define (domain UpdsideDown)
    (:requirements
        :typing
        :negative-preconditions
        :conditional-effects
        :disjunctive-preconditions
    )
    (:types
        matches keys - items
        cells
        colour
    )
    (:predicates
        ;Indicates the number of uses left in a key
        (key-infinite-uses ?k - keys)
        (key-two-use ?k - keys)
        (key-one-use ?k - keys)
        (key-used-up ?k - keys)
        ;Add other predicates needed to model this domain 
        (at ?from - cells)
        (connected ?from ?to - cells)
        (monster-in ?from - cells)
        (invigilated ?from - cells)
        (match ?m - matches)
        (fire-in)
        (key-in ?k - keys ?from - cells)
        (match-in ?m - matches ?from - cells)
        (hands-free)
        (key ?k - keys)
        (door ?from - cells ?c - colour)
        (key-c ?k - keys ?c - colour)
        (door-closed ?from - cells)
    )
    ;Hero can move if the
    ;    - hero is at current location
    ;    - cells are connected, 
    ;    - there is no monster in current loc and destination, and 
    ;    - destination is not invigilated
    ;Effects move the hero, and the original cell becomes invigilated.
    (:action move
        :parameters (?from ?to - cells)
        :precondition (and 
            (at ?from)                
            (or (connected ?from ?to) (connected ?to ?from))
            (not (monster-in ?from))
            (not (monster-in ?to))
            (not (invigilated ?to))
        )
        :effect (and 
            (at ?to)
            (invigilated ?from)
            (not (at ?from))
            (not (fire-in))
        )
    )
    ;When this action is executed, the hero leaves a location with a monster in it
    (:action move-out-of-monster
        :parameters (?from ?to - cells)
        :precondition (and 
            (at ?from)                
            (or (connected ?from ?to) (connected ?to ?from))
            (monster-in ?from)
            (fire-in)
            (not (invigilated ?to))
        )
        :effect (and 
            (at ?to)
            (invigilated ?from)
            (not (at ?from))
            (not (fire-in))
        )        
    )
    ;When this action is executed, the hero leaves a location without a monster and gets into a location with a monster
    (:action move-into-monster
        :parameters (?from ?to - cells ?m - matches)
        :precondition (and 
            (at ?from)                
            (or (connected ?from ?to) (connected ?to ?from))
            (not (monster-in ?from))
            (monster-in ?to)
            (match ?m)
            (not (invigilated ?to))
        )
        :effect (and 
            (at ?to)
            (invigilated ?from)
            (not (at ?from))
            (not (fire-in))
        )        
    )
    ;Hero's picks a key if he's in the same location
    (:action pick-key
        :parameters (?loc - cells ?k - keys)
        :precondition (and 
            (key-in ?k ?loc)    
            (at ?loc)
            (hands-free)
        )
        :effect (and
            (key ?k)
            (not (key-in ?k ?loc))
            ; (not (at ?loc))
            (not (hands-free))
        )
    )
    ;Hero's picks a match if he's in the same location
    (:action pick-match
        :parameters (?loc - cells ?m - matches)
        :precondition (and 
            (match-in ?m ?loc)    
            (at ?loc)
            (hands-free)
        )
        :effect (and
            (match ?m)
            (not (match-in ?m ?loc))
            ; (not (at ?loc))
            (not (hands-free))
        )
    )
   ;Hero's drops his key. 
    (:action drop-key
        :parameters (?loc - cells ?k - keys)
        :precondition (and 
            (key ?k)     
            (at ?loc)
            (not (hands-free))
        )
        :effect (and
            (key-in ?k ?loc)
            (hands-free)
            (not (key ?k))
            (at ?loc)
        )
    )
    ;Hero's drops his match. 
    (:action drop-match
        :parameters (?loc - cells ?m - matches)
        :precondition (and 
            (match ?m)     
            (at ?loc)
            (not (hands-free))
        )
        :effect (and
            (match-in ?m ?loc)
            (hands-free)
            (not (match ?m))
            (at ?loc)
        )
    )
    ;Hero's disarm the trap with his hand
    (:action close-gate
        :parameters (?from ?to - cells ?k - keys ?c - colour)
        :precondition (and 
            (at ?from)                
            (or (connected ?from ?to) (connected ?to ?from))
            (door ?to ?c)
            (not (hands-free))
            (key ?k)
            (key-c ?k ?c)
            (or (key-infinite-uses ?k) (key-two-use ?k) (key-one-use ?k))
        )
        :effect (and
            (not (hands-free))
            (door-closed ?to)
            ;When a key has two uses, then it becomes a single use
            (when (key-two-use ?k) (key-one-use ?k))
            ;When a key has a single use, it becomes used-up
            (when (key-one-use ?k) (key-used-up ?k))       
        )
    )
    ;Hero strikes her match
    (:action strike-match
        :parameters (?m - matches)
        :precondition (and 
            (not (hands-free))
            (match ?m)
        )
        :effect (and 
            (fire-in)
        )
    )
)