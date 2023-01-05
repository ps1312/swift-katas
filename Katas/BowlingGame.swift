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

        for frame in stride(from: 0, to: 20, by: 2) {
            let lastFrame = frame == 18
            let frameScore = getFrameScore(frame: frame)
            score += frameScore

            if !lastFrame && frameScore == 10 { // is spare, sum the next frame first roll for extra points
                let extraScore = attemps[frame + 2]
                score += extraScore
            }
        }

        return score
    }

    private func getFrameScore(frame: Int) -> Int {
        attemps[frame] + attemps[frame + 1]
    }

}
