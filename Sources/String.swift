prefix func + (str: String) -> String {
    return str.uppercased()
}

prefix func - (str: String) -> String {
    return str.lowercased()
}

prefix func ~ (str: String) -> Either<Int, Double>? {
    return str.castAsNumber()
}

extension String.CharacterView {
    func toString() -> String {
        return String(self)
    }
}

extension Character {
    func toString() -> String {
        return String(self)
    }
}

extension String {
    private static let latin1: [Character: String] = [
        "\u{00c0}": "A", "\u{00c1}": "A", "\u{00c2}": "A", "\u{00c3}": "A", "\u{00c4}": "A",
        "\u{00c5}": "A", "\u{00c6}": "AE", "\u{00c7}": "C", "\u{00c8}": "E", "\u{00c9}": "E",
        "\u{00cA}": "E", "\u{00cB}": "E", "\u{00cC}": "I", "\u{00cD}": "I", "\u{00cE}": "I",
        "\u{00cF}": "I", "\u{00d0}": "D", "\u{00d1}": "N", "\u{00d2}": "O", "\u{00d3}": "O",
        "\u{00d4}": "O", "\u{00d5}": "O", "\u{00d6}": "O", "\u{00d9}": "U", "\u{00dA}": "U",
        "\u{00dB}": "U", "\u{00dC}": "U", "\u{00dD}": "Y", "\u{00dF}": "ss", "\u{00e0}": "a",
        "\u{00e1}": "a", "\u{00e2}": "a", "\u{00e3}": "a", "\u{00e4}": "a", "\u{00e5}": "a",
        "\u{00e6}": "ae", "\u{00e7}": "c", "\u{00e8}": "e", "\u{00e9}": "e", "\u{00eA}": "e",
        "\u{00eB}": "e", "\u{00eC}": "i", "\u{00eD}": "i", "\u{00eE}": "i", "\u{00eF}": "i",
        "\u{00f1}": "n", "\u{00f2}": "o", "\u{00f3}": "o", "\u{00f4}": "o", "\u{00f5}": "o",
        "\u{00f6}": "o", "\u{00f9}": "u", "\u{00fA}": "u", "\u{00fB}": "u", "\u{00fC}": "u",
        "\u{00fD}": "y", "\u{00fF}": "y"
    ]

    private static let htmlEscapes: [Character: String] = [
        "&": "&amp;", "<": "&lt;", ">": "&gt;", "\"": "&quot;", "'": "&#39;", "`": "&#96;"
    ]

    /**
        Gets the first character of a String as a String
        If the String is empty, returns ""
        
        - Returns the first character of a String or ""
    */
    func first() -> String {
        if let first = self.characters.first {
            return first.toString()
        }
        return ""
    }

    /**
        Gets the last character of a String as a String
        If the String is empty, returns ""
        
        - Returns the last character of a String or ""
    */
    func last() -> String {
        if let last = self.characters.last {
            return last.toString()
        }
        return ""
    }

     /**
        Gets the last characterS of a String
        If the String is empty, returns ""
        
        - Returns the last characterS of a String or ""
    */
    func tail() -> String {
        return self.characters.dropFirst().toString()
    }

    /**
        Returns the String capitalized
        
        - Returns: The same String capitalized
    */
    func capitalize() -> String {
        return +self.first() + self.tail()
    }

    private func replace(cb: (str: Character) -> String) -> String {
        return self.characters.map { character in
            cb(str: character) 
        }.joined(separator: "")
    }

    private func replaceWith(_ dict: [Character: String]) -> String {
        return self.replace {character in
            if let replacement = dict[character] {
                return replacement
            }
            return character.toString()
        }
    }

    /**
        Replaces the Latin-1 characters with Unicode characters
        
        - Returns: The same String deburred
    */
    func deburr() -> String {
        return self.replaceWith(String.latin1)
    }

    /**
        Escapes the HTML characters
        
        - Returns: The same String escaped
    */
    func escape() -> String {
        return self.replaceWith(String.htmlEscapes)
    }

    /**
        Returns the String uncapitalized
        
        - Returns: The same String uncapitalized
    */
    func uncapitalize() -> String {
        return -self.first() + self.tail()
    }

    /**
      Parse String and returns an Optional Int

      - Returns: An Int or nil
    */
    func toInt() -> Int? {
        return Int(self)
    }

    /**
      Parse String and returns an Optional Double

      - Returns: A Double or nil
    */
    func toDouble() -> Double? {
        return Double(self)
    }

    func castAsNumber() -> Either<Int, Double>? {
        if let i = self.toInt() {
            return .Right(i)
        }
        if let d = self.toDouble() {
            return .Left(d)
        }
        return nil
    }
}
