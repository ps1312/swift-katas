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
        rollMany(pins: 0, for: sut, remaining: 19)

        XCTAssertEqual(sut.score(), 1)
    }

    func test_singleStrike_delivers10Points() {
        let sut = Game()

        sut.roll(pins: 10)
        rollMany(pins: 0, for: sut, remaining: 18)

        XCTAssertEqual(sut.score(), 10)
    }

    func test_singleSpare_delivers10Points() {
        let sut = Game()

        rollSpare(for: sut)
        rollMany(pins: 0, for: sut, remaining: 18)

        XCTAssertEqual(sut.score(), 10)
    }

    func test_spareWithPinsKnockedDownInNextFrame_delivers12Points() {
        let sut = Game()

        rollSpare(for: sut)
        sut.roll(pins: 1)
        rollMany(pins: 0, for: sut, remaining: 17)

        XCTAssertEqual(sut.score(), 12)
    }

    func test_spareWithPinsAfterMiss_delivers11Points() {
        let sut = Game()

        rollSpare(for: sut)
        rollFrame(for: sut, firstRoll: 0, secondRoll: 1)
        rollMany(pins: 0, for: sut, remaining: 16)

        XCTAssertEqual(sut.score(), 11)
    }

    func test_strikeWithPinsKnockedDownOnlyInFirstExtraRoll_delivers13Points() {
        let sut = Game()

        sut.roll(pins: 10)
        rollFrame(for: sut, firstRoll: 1, secondRoll: 0)
        rollMany(pins: 0, for: sut, remaining: 16)

        XCTAssertEqual(sut.score(), 12)
    }

    func test_strikeWithPinsKnockedDownOnlyInTheSecondExtraRoll_delivers13Points() {
        let sut = Game()

        sut.roll(pins: 10)
        rollFrame(for: sut, firstRoll: 0, secondRoll: 1)
        rollMany(pins: 0, for: sut, remaining: 16)

        XCTAssertEqual(sut.score(), 12)
    }

    func test_strikeWithPinsKnockedDownInNextTwoRolls_delivers14Points() {
        let sut = Game()

        sut.roll(pins: 10)
        rollFrame(for: sut, firstRoll: 1, secondRoll: 1)
        rollMany(pins: 0, for: sut, remaining: 16)

        XCTAssertEqual(sut.score(), 14)
    }

    func test_spareAndStrike_delivers30Points() {
        let sut = Game()

        rollSpare(for: sut)
        sut.roll(pins: 10)
        rollMany(pins: 0, for: sut, remaining: 16)

        XCTAssertEqual(sut.score(), 30)
    }

    func test_allSparesWithNoExtraPins_delivers145Points() {
        let sut = Game()

        rollMany(pins: 5, for: sut)
        sut.roll(pins: 0) // extra spare roll

        XCTAssertEqual(sut.score(), 145)
    }

    func test_allSparesWithExtraPins_deliversPoints() {
        let sut = Game()

        rollMany(pins: 5, for: sut)
        sut.roll(pins: 5) // extra spare roll

        XCTAssertEqual(sut.score(), 150)
    }

    func test_allStrikesWithNoExtraPins_deliversPoints() {
        let sut = Game()

        rollMany(pins: 10, for: sut, remaining: 10)
        sut.roll(pins: 0)
        sut.roll(pins: 0)

        XCTAssertEqual(sut.score(), 270)
    }

    func test_allStrikesWithOneExtraPin_deliversPoints() {
        let sut = Game()

        rollMany(pins: 10, for: sut, remaining: 10)
        sut.roll(pins: 1)
        sut.roll(pins: 0)

        XCTAssertEqual(sut.score(), 272)
    }

    private func rollMany(pins: Int, for sut: Game, remaining: Int = 20) {
        for _ in 1...remaining {
            sut.roll(pins: pins)
        }
    }

    private func rollSpare(for sut: Game) {
        sut.roll(pins: 5)
        sut.roll(pins: 5)
    }

    private func rollFrame(for sut: Game, firstRoll: Int, secondRoll: Int) {
        sut.roll(pins: firstRoll)
        sut.roll(pins: secondRoll)
    }
}
