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
    var attemps = [Int]()

    public init() {}

    public func roll(pins: Int) {
        attemps.append(pins)

        if pins == 10 {
            attemps.append(0)
        }
    }

    public func score() -> Int {
        var score = 0

        for rollIndex in stride(from: 0, to: 20, by: 2) {
            let isLastFrame = rollIndex == 18
            let frameScore = getFrameScore(frame: rollIndex)

            var extraScore = 0

            if isStrike(rollIndex) {
                if isLastFrame {
                    extraScore = getFrameScore(frame: rollIndex + 2)
                } else {
                    extraScore = getFrameScore(frame: rollIndex + 2) + getFrameScore(frame: rollIndex + 4)
                }
            } else if isSpare(rollIndex) {
                extraScore = attemps[rollIndex + 2]
            }

            score += frameScore + extraScore
        }

        return score
    }

    private func getFrameScore(frame: Int) -> Int {
        attemps[frame] + attemps[frame + 1]
    }

    private func isStrike(_ rollIndex: Int) -> Bool {
        attemps[rollIndex] == 10
    }

    private func isSpare(_ rollIndex: Int) -> Bool {
        getFrameScore(frame: rollIndex) == 10
    }

}
