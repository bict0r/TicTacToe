//
//  ViewController.swift
//  TicTacToe
//
//  Created by Russell Collins on 7/12/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topLeftButton: UIButton!
    @IBOutlet weak var topMiddleButton: UIButton!
    @IBOutlet weak var topRightButton: UIButton!
    @IBOutlet weak var middleLeft: UIButton!
    @IBOutlet weak var middleMiddle: UIButton!
    @IBOutlet weak var middleRight: UIButton!
    @IBOutlet weak var bottomLeft: UIButton!
    @IBOutlet weak var bottomMiddle: UIButton!
    @IBOutlet weak var bottomRight: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
    }
    
    func startNewGame() {
        game.reset()
        setBoard()
    }

    func setBoard() {
        topLeftButton.setTitle(game.getMark(inRow: 0, andColumn: 0), for: .normal)
        topMiddleButton.setTitle(game.getMark(inRow: 0, andColumn: 1), for: .normal)
        topRightButton.setTitle(game.getMark(inRow: 0, andColumn: 2), for: .normal)
        middleLeft.setTitle(game.getMark(inRow: 1, andColumn: 0), for: .normal)
        middleMiddle.setTitle(game.getMark(inRow: 1, andColumn: 1), for: .normal)
        middleRight.setTitle(game.getMark(inRow: 1, andColumn: 2), for: .normal)
        bottomLeft.setTitle(game.getMark(inRow: 2, andColumn: 0), for: .normal)
        bottomMiddle.setTitle(game.getMark(inRow: 2, andColumn: 1), for: .normal)
        bottomRight.setTitle(game.getMark(inRow: 2, andColumn: 2), for: .normal)
    }

    @IBAction func startNewGamePressed(_ sender: Any) {
        startNewGame()
    }
    
    func showTicTacToe(withState boardState : TicTacToe) {
        guard boardState != .None else { return }
        switch boardState {
        case .TopRow:
            topLeftButton.setTitleColor(.red, for: .normal)
            topMiddleButton.setTitleColor(.red, for: .normal)
            topRightButton.setTitleColor(.red, for: .normal)
        default: break
        }
    }
    
    
    
    @IBAction func choseMark(_ sender: UIButton) {
        var won : TicTacToe = .None
        print(sender.tag)
        switch  sender.tag {
        case 1: game.place(inRow: 0, andColumn: 0)
            won = game.haveTTT(onRow: 0, andColumn: 0)
        case 2: game.place(inRow: 0, andColumn: 1)
            won = game.haveTTT(onRow: 0, andColumn: 1)
        case 3: game.place(inRow: 0, andColumn: 2)
            won = game.haveTTT(onRow: 0, andColumn: 2)
        case 4: game.place(inRow: 1, andColumn: 0)
            won = game.haveTTT(onRow: 1, andColumn: 0)
        case 5: game.place(inRow: 1, andColumn: 1)
            won = game.haveTTT(onRow: 1, andColumn: 1)
        case 6: game.place(inRow: 1, andColumn: 2)
            won = game.haveTTT(onRow: 1, andColumn: 2)
        case 7: game.place(inRow: 2, andColumn: 0)
            won = game.haveTTT(onRow: 2, andColumn: 0)
        case 8: game.place(inRow: 2, andColumn: 1)
            won = game.haveTTT(onRow: 2, andColumn: 1)
        case 9: game.place(inRow: 2, andColumn: 2)
            won = game.haveTTT(onRow: 2, andColumn: 2)
        default: break
        }
        // print(won)
        showTicTacToe(withState: won)
        setBoard()
    }
    
    
    
    
    
    
}
