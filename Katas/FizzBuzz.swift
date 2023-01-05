public func fizzBuzz(_ number: Int) -> String {
    if number.isMultiple(of: 15) {
        return "FizzBuzz"
    } else if number.isMultiple(of: 3) {
        return "Fizz"
    } else if number.isMultiple(of: 5) {
        return "Buzz"
    } else {
        return "\(number)"
    }
}
