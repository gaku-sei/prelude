infix operator <<< { associativity left }

infix operator >>> { associativity left }

func <<< <T, U, V>(f: (U) -> V, g: (T) -> U) -> (T -> V) {
    return { (arg: T) in f(g(arg)) }
}

func >>> <T, U, V>(f: (T) -> U, g: (U) -> V) -> (T -> V) {
    return { (arg: T) in g(f(arg)) }
}
