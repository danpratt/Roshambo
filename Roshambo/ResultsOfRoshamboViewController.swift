//
//  ResultsOfRoshamboViewController.swift
//  Roshambo
//
//  Created by Daniel Pratt on 2/6/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import UIKit

class ResultsOfRoshamboViewController: UIViewController {
    
    var model: RoshamboModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Figure out who won
        let didPlayerWin = model?.getWinner()
        // call function to update display to show results
        displayWinner(didPlayerWin!)
            }
    
    // MARK: Display Winner
    
    private func displayWinner(_ didPlayerWin: RoshamboModel.PlayerWon) {
        switch didPlayerWin {
        case .won:
            print("Player won")
        case .lost:
            print("Player lost")
        case .tie:
            print("Player tied")
        }
    }
    
    @IBAction func playAgainButtonPressed(_ sender: Any) {
        // just go back to the Pick view controller
        self.dismiss(animated: true, completion: nil)
    }
    

}
