//
//  RoshamboModel.swift
//  Roshambo
//
//  Created by Daniel Pratt on 2/6/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import UIKit

class RoshamboModel {
    
    private var playerChoice: RoshamboType
    private var computerChoice:RoshamboType!
    private var isPlayerWinner: PlayerWon {
        return checkIfPlayerWon()
    }
    
    // Holds Enum to figure out what to show on the view.
    var resultsMessage: ResultsMessages!
    
    enum RoshamboType: Int {
        case rock = 0, paper, scissors
    }
    
    enum PlayerWon: Int {
        case won = 0, lost, tie
    }
    
    enum ResultsMessages: String {
        case rock = "Rock Smashes Scissors"
        case paper = "Paper Covers Rock"
        case scissors = "Scissors Cuts Paper"
        case tie = "They are the Same"
    }
    
    private func randomComputerChoice() -> RoshamboType {
        
        let number = arc4random() % 3
        return RoshamboType.init(rawValue: Int(number))!
    }
    
    func getWinner() -> PlayerWon {
        return isPlayerWinner
    }
    
    private func checkIfPlayerWon() -> PlayerWon {
        print("Checking winner")
        print("Player has: \(playerChoice)")
        print ("Computer has: \(computerChoice!)")
        if playerChoice == computerChoice {
            resultsMessage = .tie
            return .tie
        }
        
        switch playerChoice {
        case .rock:
            print("Checking rock case")
            resultsMessage = ResultsMessages.rock
            return computerChoice == .scissors ? .won : .lost
        case .paper:
            print("Checking paper case")
            resultsMessage = ResultsMessages.paper
            return computerChoice == .rock ? .won : .lost
        case .scissors:
            print("Checking scissors case")
            resultsMessage = ResultsMessages.scissors
            return computerChoice == .paper ? .won : .lost
        }
        
    }
    
    init(_ playerChoice: RoshamboType) {
        self.playerChoice = playerChoice
        self.computerChoice = randomComputerChoice()
        print("Initializing")
        print("Player: \(playerChoice)")
        print("Computer: \(computerChoice!)")
    }
    
    
}
