module ShuntingGame

// import ordering for recording states
open util/ordering[State] as ord

/**
 *   --
 *   --
 * ---0---
 * X0---0-
 *   -0
 *   --
 *
 * The initial state of the program and shape of board
 * - : empty slot
 * 0 : white ball
 * X : black ball
 * (Int[2], Int[2]),  (Int[2], Int[3]), (Int[3], Int[2]), (Int[3], Int[3]) are destination for white balls
 */
pred locationConstraint(loc:Int -> Int) {
    loc in (Int[0] + Int[1] + Int[2] + Int[3] + Int[4] + Int[5] + Int[6]) -> (Int[2] + Int[3]) + 
    (Int[2] + Int[3]) -> (Int[0] + Int[1] + Int[2] + Int[3] + Int[4] + Int[5])
}

sig State {blackPiece:Int -> Int, whitePieces:Int -> Int} {
    locationConstraint[whitePieces + blackPiece]
    #blackPiece=1
    #whitePieces=4
}

// return true if a is next to b
pred next1(a, b:Int->Int) {
    locationConstraint[a+b] &&
    ((int a.Int = int b.Int && (int Int.a - int Int.b = 1 || int Int.b - int Int.a = 1)) ||
    (int Int.a = int Int.b && (int a.Int - int a.Int = 1 || int b.Int - int a.Int = 1)))
}

// initial states, as stated in the diagram above
fact initialState {
    let s0=ord/first {
        s0.blackPiece = Int[0] -> Int[3]
        s0.whitePieces = Int[1] -> Int[3] + Int[3] -> Int[2] + Int[3] -> Int[4] + Int[5] -> Int[3]
    }
}

// program finished state
pred over(wpson:Int -> Int) {
    wpson = Int[2] -> Int[2] + Int[2] -> Int[3] + Int[3] -> Int[3] + Int[3] -> Int[2]
}

// movable pieces
pred move(bpson, bpson':Int -> Int, wpson, wpson':Int -> Int) {
    bpson = bpson'
    wpson = wpson'
}

fact stateTransition {
    all s:State, s':ord/next[s] {
        ! over[s.whitePieces] => move[s.blackPiece, s'.blackPiece, s.whitePieces, s'.whitePieces]
    }
}

pred solvePuzzle() {
    over[(ord/last).whitePieces]
}

run solvePuzzle for 55 State, 4 int
