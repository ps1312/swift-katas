import XCTest
import Katas

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

        rollSpare(for: sut)
        rollMany(pins: 0, for: sut, left: 18)

        XCTAssertEqual(sut.score(), 10)
    }

    func test_spareWithPinsKnockedDownInNextFrame_delivers12Points() {
        let sut = Game()

        rollSpare(for: sut)
        sut.roll(pins: 1)
        rollMany(pins: 0, for: sut, left: 17)

        XCTAssertEqual(sut.score(), 12)
    }

    func test_strikeWithPinsKnockedDownInNextFrame_delivers13Points() {
        let sut = Game()

        sut.roll(pins: 10)

        sut.roll(pins: 2)
        sut.roll(pins: 0)

        rollMany(pins: 0, for: sut, left: 16)

        XCTAssertEqual(sut.score(), 14)
    }

    func test_spareAndStrike_delivers30Points() {
        let sut = Game()

        rollSpare(for: sut)

        sut.roll(pins: 10)

        rollMany(pins: 0, for: sut, left: 16)

        XCTAssertEqual(sut.score(), 30)
    }

    private func rollMany(pins: Int, for sut: Game, left: Int = 20) {
        for _ in 1...left {
            sut.roll(pins: 0)
        }
    }

    private func rollSpare(for sut: Game) {
        sut.roll(pins: 5)
        sut.roll(pins: 5)
    }
}
