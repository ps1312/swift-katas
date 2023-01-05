import XCTest
import Katas

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
