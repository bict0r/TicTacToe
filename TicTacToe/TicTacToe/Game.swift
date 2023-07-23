//
//  Game.swift
//  TicTacToe
//
//  Created by Russell Collins on 7/12/23.
//

import Foundation

enum TicTacToe {
    case None
    case TopRow
    case MiddleRow
    case BottomRow
    case LeftColumn
    case MiddleColumn
    case RightColumn
    case ForwardDiagonal
    case BackwardDiagonal
}

struct Game {
    static var X = "X"
    static var O = "O"
    static var S = " "
    
    var turn: String = Game.S
    var top:    [String] = ["X", "X", "X"]
    var middle: [String] = ["X", "X", "X"]
    var bottom: [String] = ["X", "X", "X"]
    
    mutating func reset() {
        for n in 0...2 {
            top[n] = Game.S
            middle[n] = Game.S
            bottom[n] = Game.S
        }
        turn = Game.X
    }
    
    mutating func toggle() {
        turn = turn == Game.X ? Game.O : Game.X
    }
    
    func whoseTurnIsIt() -> String {
        return turn
    }
    
    func getMark(inRow row: Int, andColumn col: Int) -> String {
        switch row {
        case 0:     return top[col]             // top row
        case 1:     return middle[col]          // middle row
        case 2:     return bottom[col]          // bottom row
        default:    return Game.S
        }
    }
    
    func canPlace(inRow row: Int, andColumn col: Int) -> Bool {
        switch row {
        case 0:     return top[col] == Game.S           // top row
        case 1:     return middle[col] == Game.S        // middle row
        case 2:     return bottom[col] == Game.S        // bottom row
        default:    return false
        }
    }
    
    mutating func place(inRow row: Int, andColumn col: Int) {
        if !canPlace(inRow: row, andColumn: col) { return }
  
        switch row {
        case 0:     top[col]    = turn        // top row
        case 1:     middle[col] = turn        // middle row
        case 2:     bottom[col] = turn        // bottom row
        default:    return
        }
        toggle()
        
        
    }
    
    mutating func place(inRow row: Int, andColumn col: Int, using mark: String) -> Bool {
        if !canPlace(inRow: row, andColumn: col) { return false }
  
        switch row {
        case 0:     top[col]    = mark        // top row
        case 1:     middle[col] = mark        // middle row
        case 2:     bottom[col] = mark        // bottom row
        default:    return false
        }
    
        return true
        
        
    }

    func isAllIn(first : String, second: String, andThird third: String) -> Bool {
        let inLine =  first + second + third
        let AllXs = "XXX"
        let AllOs = "OOO"
        return inLine == AllXs || inLine == AllOs
    }
    
    func haveTTT(onRow row: Int, andColumn col: Int) -> TicTacToe {
        if isAllIn(first: top[0], second: top[1], andThird: top[2]) {
            return .TopRow
        }
        if isAllIn(first: middle[0], second: middle[1], andThird: middle[2]) {
            return .MiddleRow
        }
        if isAllIn(first: bottom[0], second: bottom[1], andThird: bottom[2]) {
            return .BottomRow
        }
        if isAllIn(first: top[0], second: middle[0], andThird: bottom[0]) {
            return .LeftColumn
        }
        if isAllIn(first: top[1], second: middle[1], andThird: bottom[1]) {
            return .MiddleColumn
        }
        if isAllIn(first: top[2], second: middle[2], andThird: bottom[2]) {
            return .RightColumn
        }
        if isAllIn(first: top[0], second: middle[1], andThird: bottom[2]) {
            return .BackwardDiagonal
        }
        if isAllIn(first: top[2], second: middle[1], andThird: bottom[0]) {
            return .ForwardDiagonal
        }
        return .None
    }
}

var game: Game = Game()
