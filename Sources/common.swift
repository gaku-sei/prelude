enum Result<T> {
    case Ok(T)
    case Error
}

enum Either<T, U> {
    case Right(T)
    case Left(U)
}

extension Optional {
    func unwrap() -> Result<Wrapped> {
        if let ok = self {
            return .Ok(ok)
        }
        return .Error
    }
}
