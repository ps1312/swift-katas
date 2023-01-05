import XCTest

/*
 Write a program using TDD that prints the numbers from 1 to 100.

 For multiples of 3, print "Fizz"
 For multiples of 5, print "Buzz"
 For multiples of both, print "FizzBuzz"
*/

func fizzBuzz(_ number: Int) -> String {
    if number.isMultiple(of: 3) {
        return "Fizz"
    } else if number == 5 {
        return "Buzz"
    } else {
        return "\(number)"
    }
}

class FizzBuzzTests: XCTestCase {

    func test_printsOne() {
        XCTAssertEqual(fizzBuzz(1), "1")
    }

    func test_printsTwo() {
        XCTAssertEqual(fizzBuzz(2), "2")
    }

    func test_printsFizzWhenNumberIsMultipleOfThree() {
        XCTAssertEqual(fizzBuzz(3), "Fizz")
        XCTAssertEqual(fizzBuzz(6), "Fizz")
        XCTAssertEqual(fizzBuzz(9), "Fizz")
        XCTAssertEqual(fizzBuzz(51), "Fizz")
        XCTAssertEqual(fizzBuzz(99), "Fizz")
    }

    func test_printsFour() {
        XCTAssertEqual(fizzBuzz(4), "4")
    }

    func test_printsBuzzWhenNumberIsFive() {
        XCTAssertEqual(fizzBuzz(5), "Buzz")
    }
}
