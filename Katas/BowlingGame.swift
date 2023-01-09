import Foundation

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

public final class Game {
    var rolls = [Int]()
    var currentRoll = 0

    public init() {}

    public func roll(pins: Int) {
        rolls.append(pins)
    }

    public func score() -> Int {
        var scoreSum = 0

        for _ in 0...9 {
            if isStrike() {
                scoreSum += 10 + getFrameScore(currentRoll + 1)
                currentRoll += 1
            } else {
                if isSpare() {
                    scoreSum += 10 + rolls[currentRoll + 2]
                } else {
                    scoreSum += getFrameScore(currentRoll)
                }
                currentRoll += 2
            }
        }

        return scoreSum
    }

    private func getFrameScore(_ rollIndex: Int) -> Int {
        rolls[rollIndex] + rolls[rollIndex + 1]
    }

    private func isStrike() -> Bool {
        rolls[currentRoll] == 10
    }

    private func isSpare() -> Bool {
        (rolls[currentRoll] + rolls[currentRoll + 1]) == 10
    }
}
