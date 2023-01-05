import XCTest

/*

 Bowling Rules
 - a game consists of 10 frames
 - in each frame, 2 rolls for each
 - in each roll, the bowler can down 10 pins

 - the score of the frame is the total number of pins knocked down (MAX 10) + bonuses:
    - spare(10 pins in two rolls) : + next roll
    - strike(10 pins in a single roll) : + next 2 rolls

 - the bowler gets an additional roll if a spare is earned and two if a strike is earned on the 10th frame

*/

final class Game {
    var totalSum = 0

    func roll(pins: Int) {
        totalSum += pins
    }

    func score() -> Int {
        return totalSum
    }

}

class BowlingGameTests: XCTestCase {

    func test_gutterGame_deliversZeroPoints() {
        let sut = Game()

        for _ in 1...20 {
            sut.roll(pins: 0)
        }

        XCTAssertEqual(sut.score(), 0)
    }

    func test_onePin_deliversOnePoint() {
        let sut = Game()

        for index in 1...20 {
            sut.roll(pins: index == 1 ? 1 : 0)
        }

        XCTAssertEqual(sut.score(), 1)
    }

}
