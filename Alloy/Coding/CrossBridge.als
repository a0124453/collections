module CrossBridge

open util/ordering[State] as ord

abstract sig Person { time: Int }

one sig Father, Mother, Son, Grandma extends Person {}

fact crossing {
    int Father.time=1 && int Mother.time=2 && int Son.time=5 &&int Grandma.time=10
}

sig State {
    east: set Person,
    west: set Person,
    time, u: Int
}

// In the initial state, all objects are on the east side.
fact initialState {
    let s0 = ord/first[] | s0.east = Person && no s0.west && int s0.time = 0 && int s0.u=0
}

pred crossBridge [from, from', to, to': set Person, t, t', u, u': Int] {
    (some disj p1, p2: from {
        from' = from - p1 - p2
        to' = to + p1 + p2
        int p1.time > int p2.time => int t'= int t.plus[int p1.time]
        int p1.time < int p2.time => int t'= int t.plus[int p2.time]
        int u =0 => int u'=1
        int u=1 => int u'=0
     } )||
     (some p: from {
        from' = from - p
        to' = to + p
        int t'= int t + int p.time
        int u =0 => int u'=1
        int u=1 => int u'=0
    })
}

fact stateTransition {
    all s: State, s': ord/next[s] {
        s.west != Person =>
            (int s.u=0 =>
                crossBridge[s.east, s'.east, s.west, s'.west, s.time, s'.time, s.u, s'.u] else
                crossBridge[s.west, s'.west, s.east, s'.east, s.time, s'.time,s.u, s'.u]) else
            s'=s }
}

pred solvePuzzle [] {
    ord/last[].west = Person && int ord/last[].time=<17
}

run solvePuzzle for 8 State, 6 int expect 1
