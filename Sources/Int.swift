extension Int {
    func time(cb: (Int) -> Any) {
        for i in 0..<self {
            cb(i)
        }
    }

    func time(cb: () -> Any) {
        for _ in 0..<self {
            cb()
        }
    }
}
