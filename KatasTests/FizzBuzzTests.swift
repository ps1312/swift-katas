import XCTest

/*
 Write a program using TDD that prints the numbers from 1 to 100.

 For multiples of 3, print "Fizz"
 For multiples of 5, print "Buzz"
 For multiples of booth, print "FizzBuzz"
*/

func fizzBuzz() -> [Int] {
    return [1, 2]
}

class FizzBuzzTests: XCTestCase {

    func test_printsOneAndTwo() {
        XCTAssertEqual(fizzBuzz(), [1, 2])
    }

}
