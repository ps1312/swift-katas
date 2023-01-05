import XCTest

/*
 Write a program using TDD that prints the numbers from 1 to 100.

 For multiples of 3, print "Fizz"
 For multiples of 5, print "Buzz"
 For multiples of both, print "FizzBuzz"
*/

func fizzBuzz(_ number: Int) -> String {
    if number == 3 {
        return "Fizz"
    }

    return "\(number)"
}

class FizzBuzzTests: XCTestCase {

    func test_printsOne() {
        XCTAssertEqual(fizzBuzz(1), "1")
    }

    func test_printsTwo() {
        XCTAssertEqual(fizzBuzz(2), "2")
    }

    func test_printsFizzWhenNumberIsThree() {
        XCTAssertEqual(fizzBuzz(3), "Fizz")
    }

}
