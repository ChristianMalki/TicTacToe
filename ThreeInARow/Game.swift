//
//  Game.swift
//  ThreeInARow
//
//  Created by Christian Malki on 2022-09-13.
//

import Foundation

class Player {
    
    var name: String
    var marker: String
    var number: Int

    
    
    init(name: String, marker: String, number: Int) {
        self.name = name
        self.marker = marker
        self.number = number
    }
    
}

class Game {
    private var board = [0,0,0,0,0,0,0,0,0]
    let player1: Player
    let player2: Player
    
    var GAME_CONTINUE = 0
    let RESULT_PLAYER1 = 1
    let RESULT_PLAYER2 = 2
    let RESULT_DRAW = 3
    let GAME_ENDED = 4
    let CELL_BUSY = 5
    
    var gameStatus: Int
    
    var currentPlayer: Player
    var previousPlayer: Player?
    
    func endGame(result: Int) -> Int {
        switchPlayers()
        gameStatus = result
        return result
    }
    
    init(player1: Player, player2: Player) {
        self.player1 = player1
        self.player2 = player2
        self.gameStatus = GAME_CONTINUE
        self.currentPlayer = player1
    
    }
    // when you switch player afer every round
    func switchPlayers () {
        print(currentPlayer.number)
        if currentPlayer.number == 1 {
            print("Switching from player 1 to 2")
            currentPlayer = player2
            previousPlayer = player1
        } else {
            currentPlayer = player1
            previousPlayer = player2
            
            
        }
        
    }

    
    func addMove(index: Int) -> Int {
        
        
        
        // If the game is running, dvs GAME_CONTINUE
        
        if gameStatus != GAME_CONTINUE {
            return gameStatus
        }
        
        if board[index] != 0 {
            return CELL_BUSY // The cell yoy're trying to select is already taken.
        }
        
        print("chosen: \(currentPlayer.number)")
        
        board[index] = currentPlayer.number
        
        let result = checkWin()
        
        if result != GAME_CONTINUE {
            return endGame(result: result)
        }
        // The game ends draw
        var count = 0
        
        for cell in board {
            if cell != 0 {
                count += 1
            }
        }
        
        if count > 8 {
            return endGame(result: RESULT_DRAW)
        }
        
        switchPlayers()
        
        // If someone has won.
        print("previusplayer \(previousPlayer?.name)")
     return GAME_CONTINUE
        
    }

    
    func checkWin() -> Int { // If one of the players gets tic tac toe on one of the rows vertically, you win.
        
        // Row 1
        
        if board[0] == board[1] && board[0] == board[2] && board[0] != 0 {
            return board[1]
        }
        
        
        // Row 2
        if board[3] == board[4] && board[3] == board[5] && board[3] != 0 {
            return board[5]
        }
        
        // Row 3
        if board[6] == board[7] && board[6] == board[8] && board[6] != 0 {
            return board[7]
                }
        // Column 1
        if board[0] == board[3] && board[0] == board[6] && board[0] != 0 {
            return board[3]
        }
        // Column 2
        if board[1] == board[4] && board[1] == board[7] && board[0] != 0 {
            return board[4]
        }
        // Column 3
        if board[2] == board[5] && board[2] == board[8] && board[0] != 0 {
            return board[5]
        }
        // Diagonal 1
        if board[0] == board[4] && board[0] == board[8] && board[0] != 0 {
            return board[8]
        }
        // Diagonal 2
        if board[2] == board[4] && board[2] == board[6] && board[2] != 0 {
            return board[0]
        }
                
        return GAME_CONTINUE
                    
    }

}

      
