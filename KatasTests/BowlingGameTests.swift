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

        rollMany(pins: 0, for: sut)

        XCTAssertEqual(sut.score(), 0)
    }

    func test_onePin_deliversOnePoint() {
        let sut = Game()

        sut.roll(pins: 1)
        rollMany(pins: 0, for: sut, left: 19)

        XCTAssertEqual(sut.score(), 1)
    }

    func test_singleStrike_delivers10Points() {
        let sut = Game()

        sut.roll(pins: 10)
        rollMany(pins: 0, for: sut, left: 19)

        XCTAssertEqual(sut.score(), 10)
    }

    func test_singleSpare_delivers10Points() {
        let sut = Game()

        sut.roll(pins: 5)
        sut.roll(pins: 5)
        rollMany(pins: 0, for: sut, left: 18)

        XCTAssertEqual(sut.score(), 10)
    }

    private func rollMany(pins: Int, for sut: Game, left: Int = 20) {
        for _ in 1...left {
            sut.roll(pins: 0)
        }
    }
}
