//
//  ViewController.swift
//  Roshambo
//
//  Created by Daniel Pratt on 2/6/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import UIKit

class PickRoshamboViewController: UIViewController {
    
    @IBOutlet var buttonsWithImages: [UIButton]!
    
    
    private var model: RoshamboModel?
    private var playerChoice: RoshamboModel.RoshamboType?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Aspect Fit the buttons
        for button in buttonsWithImages {
            button.imageView?.contentMode = .scaleAspectFit
        }
    }
    
    private func createRoshamboModel () {
        model = RoshamboModel(self.playerChoice!)
    }

    
    @IBAction func rockButtonPressed(_ sender: Any) {
        
        playerChoice = .rock
        createRoshamboModel()
        var resultsController: ResultsOfRoshamboViewController
        
        resultsController = self.storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsOfRoshamboViewController
        resultsController.model = self.model
        
        present(resultsController, animated: true, completion: nil)
    }
    @IBAction func scissorsButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "gameWinSegue", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gameWinSegue" {
            if let title = (sender as! UIButton).title(for: .normal) {
                if title == "paper" {
                    self.playerChoice = .paper
                } else {
                    self.playerChoice = .scissors
                }
            } else {
                self.playerChoice = .rock
            }
            let resultsController = segue.destination as! ResultsOfRoshamboViewController
            createRoshamboModel()
            resultsController.model = self.model
        }
    
    }
}

