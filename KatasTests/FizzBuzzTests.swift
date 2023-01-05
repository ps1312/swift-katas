import XCTest

/*
 Write a program using TDD that prints the numbers from 1 to 100.

 For multiples of 3, print "Fizz"
 For multiples of 5, print "Buzz"
 For multiples of both, print "FizzBuzz"
*/

func fizzBuzz(_ number: Int) -> String {
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

class FizzBuzzTests: XCTestCase {
    func test_printsNumber() {
        XCTAssertEqual(fizzBuzz(1), "1")
        XCTAssertEqual(fizzBuzz(2), "2")
        XCTAssertEqual(fizzBuzz(4), "4")
        XCTAssertEqual(fizzBuzz(53), "53")
        XCTAssertEqual(fizzBuzz(97), "97")
    }

    func test_printsFizzWhenNumberIsMultipleOfThree() {
        XCTAssertEqual(fizzBuzz(3), "Fizz")
        XCTAssertEqual(fizzBuzz(6), "Fizz")
        XCTAssertEqual(fizzBuzz(9), "Fizz")
        XCTAssertEqual(fizzBuzz(51), "Fizz")
        XCTAssertEqual(fizzBuzz(99), "Fizz")
    }

    func test_printsBuzzWhenNumberIsMultipleOfFive() {
        XCTAssertEqual(fizzBuzz(5), "Buzz")
        XCTAssertEqual(fizzBuzz(10), "Buzz")
        XCTAssertEqual(fizzBuzz(20), "Buzz")
        XCTAssertEqual(fizzBuzz(85), "Buzz")
        XCTAssertEqual(fizzBuzz(95), "Buzz")
    }

    func test_printsFizzBuzzWhenNumberIsMultipleOfFifteen() {
        XCTAssertEqual(fizzBuzz(15), "FizzBuzz")
        XCTAssertEqual(fizzBuzz(30), "FizzBuzz")
        XCTAssertEqual(fizzBuzz(45), "FizzBuzz")
        XCTAssertEqual(fizzBuzz(60), "FizzBuzz")
        XCTAssertEqual(fizzBuzz(75), "FizzBuzz")
        XCTAssertEqual(fizzBuzz(90), "FizzBuzz")
    }
}
