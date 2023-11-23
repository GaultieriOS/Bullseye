//
//  Game.swift
//  Bullseye
//
//  Created by Gaultier on 22/11/2023.
//

import Foundation

struct Leaderboard {
    var score: Int
    var date: Date
}

class GameViewModel : ObservableObject{

    @Published var alertIsVisible: Bool = false
    @Published var isPopoverVisible = false
    @Published var target: Int = Int.random(in: 1...100)
    var sliderValue : Double = 20.0
    var score : Int = 0
    var round : Int = 1
    var awardedPoints = 0
    
    var leaderboardEntries: [Leaderboard] = []
    
    func getScore(){
        score += awardedPoints
        round += 1
        target = Int.random(in: 1...100)
        addToLeaderboard(score: awardedPoints)
    }
    
    func points(sliderValue: Int) -> Int {
        let difference = abs(sliderValue - target)
        awardedPoints = 100 - difference
        return awardedPoints
    }
    
    func restartGame(){
        target = Int.random(in: 1...100)
        score = 0
        round = 1
    }
    
    func addToLeaderboard(score: Int){
        leaderboardEntries.append(Leaderboard(score: score, date: Date()))
        leaderboardEntries.sort { entry1, entry2 in
            entry1.score > entry2.score
        }
    }
    
}
