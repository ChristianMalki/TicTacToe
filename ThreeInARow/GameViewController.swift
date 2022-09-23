//
//  ViewController.swift
//  ThreeInARow
//
//  Created by Christian Malki on 2022-09-13.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var lblTop: UILabel!
   
    @IBOutlet var cellButtons: [UIButton]!
    @IBOutlet weak var btnReplay: UIButton!
    
    
    var game: Game = Game(player1: Player(name: "Player 1", marker: "O", number: 1), player2: Player(name: "Player 2", marker: "X", number: 2))
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    game = Game(player1: Player(name: "Player 1", marker: "O", number: 1), player2: Player(name: "Player 2", marker: "X", number: 2))
        lblTop.text = "\(game.currentPlayer.name)'s turn!"
        // Do any additional setup after loading the view.
    
    }

    @IBAction func btnReplay(_ sender: UIButton) {
        game = Game(player1: Player(name: "Player 1", marker: "O", number: 1), player2: Player(name: "Player 2", marker: "X", number: 2))
        
        for button in cellButtons {
            button.setTitle(nil, for: .normal)
            
        }
        btnReplay.setTitle("Replay", for: .normal)
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        let result = game.addMove(index: sender.tag)
        
       
        // There I print every switch reuslt
        switch result {
        case game.CELL_BUSY:
            print("Busy")
        case game.GAME_CONTINUE:
            print("Continue")
            sender.setTitle(game.previousPlayer?.marker, for: .normal)
        case game.RESULT_PLAYER1:
            sender.setTitle(game.previousPlayer?.marker, for: .normal)
            lblTop.text = "Player 1 won!"
            btnReplay.isHidden = false
        case game.RESULT_PLAYER2:
            sender.setTitle(game.previousPlayer?.marker, for: .normal)
            lblTop.text = "Player 2 won!"
        case game.RESULT_DRAW:
            sender.setTitle(game.previousPlayer?.marker, for: .normal)
            lblTop.text = "Tie!"
            
        default: print("Hello")
            
            
        }
    }
}
