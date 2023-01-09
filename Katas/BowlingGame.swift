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
    var currentRoll = 0

    public init() {}

    public func roll(pins: Int) {
        attemps.append(pins)
    }

    public func score() -> Int {
        var frameIndex = 0
        var score = 0

        while frameIndex < 10 {
            if attemps[currentRoll] == 10 {
                score += 10 + attemps[currentRoll + 1] + attemps[currentRoll + 2]
                currentRoll += 1
            } else {
                if (attemps[currentRoll] + attemps[currentRoll + 1]) == 10 {
                    score += 10 + attemps[currentRoll + 2]
                } else {
                    score += attemps[currentRoll] + attemps[currentRoll + 1]
                }
                currentRoll += 2
            }
            frameIndex += 1
        }

        return score
    }
}
