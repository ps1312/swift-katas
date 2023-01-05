import XCTest

/*
 Write a program using TDD that prints the numbers from 1 to 100.

 For multiples of 3, print "Fizz"
 For multiples of 5, print "Buzz"
 For multiples of both, print "FizzBuzz"
*/

func fizzBuzz(_ number: Int) -> Int {
    return number
}

class FizzBuzzTests: XCTestCase {

    func test_printsOne() {
        XCTAssertEqual(fizzBuzz(1), 1)
    }

    func test_printsTwo() {
        XCTAssertEqual(fizzBuzz(2), 2)
    }

}
