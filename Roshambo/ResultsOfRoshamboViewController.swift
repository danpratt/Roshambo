//
//  ResultsOfRoshamboViewController.swift
//  Roshambo
//
//  Created by Daniel Pratt on 2/6/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import UIKit

class ResultsOfRoshamboViewController: UIViewController {
    
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var reasonForResultLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    var model: RoshamboModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Fix image size
        resultImage.contentMode = .scaleAspectFit
        // Figure out who won
        let didPlayerWin = model?.getWinner()
        // call function to update display to show results
        displayWinner(didPlayerWin!)
            }
    
    // MARK: Display Winner
    
    private func displayWinner(_ didPlayerWin: RoshamboModel.PlayerWon) {
        
        print("About to switch winning")
        
        // Update the result label
        switch didPlayerWin {
        case .won:
            resultLabel.text = "You Won!"
        case .lost:
            resultLabel.text = "You Lost..."
        case .tie:
            resultLabel.text = "You Tied"
        }
        
        // Update the image and result reason
        if let resultMessage = model?.resultsMessage {
            print(resultMessage)
            reasonForResultLabel.text = resultMessage.rawValue
            switch resultMessage {
            case .tie:
                resultImage.image = UIImage(named: "itsATie")
            case .rock:
                resultImage.image = UIImage(named: "RockCrushesScissors")
            case .paper:
                resultImage.image = UIImage(named: "PaperCoversRock")
            case .scissors:
                resultImage.image = UIImage(named: "ScissorsCutPaper")
            }
        }
        // This should never happen
        else {
            let alertViewController = UIAlertController(title: "Uh-Oh", message: "Something in the logic went wrong", preferredStyle: .actionSheet)
            alertViewController.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) -> Void in
            self.reasonForResultLabel.text = "Fatal Error"
            }))
            self.present(alertViewController, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func playAgainButtonPressed(_ sender: Any) {
        // just go back to the Pick view controller
        self.dismiss(animated: true, completion: nil)
    }
    

}
