//
//  Game.swift
//  TicTacToe
//
//  Created by Victor Fernandez on 7/12/23.
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
    
    var turn: String = Game.X
    var board: [[String]] = [[Game.S, Game.S, Game.S],
                             [Game.S, Game.S, Game.S],
                             [Game.S, Game.S, Game.S]]
    
    mutating func reset() {
        for row in 0...2 {
            for col in 0...2 {
                board[row][col] = Game.S
            }
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
        return board[row][col]
    }
    
    func canPlace(inRow row: Int, andColumn col: Int) -> Bool {
        return board[row][col] == Game.S
    }
    
    mutating func place(inRow row: Int, andColumn col: Int) {
        if !canPlace(inRow: row, andColumn: col) { return }
        board[row][col] = turn
        toggle()
    }
    
    mutating func place(inRow row: Int, andColumn col: Int, using mark: String) -> Bool {
        if !canPlace(inRow: row, andColumn: col) { return false }
        board[row][col] = mark
        return true
    }

    func isAllIn(first : String, second: String, andThird third: String) -> Bool {
        let inLine =  first + second + third
        let AllXs = "XXX"
        let AllOs = "OOO"
        return inLine == AllXs || inLine == AllOs
    }
    
    func haveTTT(onRow row: Int, andColumn col: Int) -> TicTacToe {
        if isAllIn(first: board[0][0], second: board[0][1], andThird: board[0][2]) {
            return .TopRow
        }
        if isAllIn(first: board[1][0], second: board[1][1], andThird: board[1][2]) {
            return .MiddleRow
        }
        if isAllIn(first: board[2][0], second: board[2][1], andThird: board[2][2]) {
            return .BottomRow
        }
        if isAllIn(first: board[0][0], second: board[1][0], andThird: board[2][0]) {
            return .LeftColumn
        }
        if isAllIn(first: board[0][1], second: board[1][1], andThird: board[2][1]) {
            return .MiddleColumn
        }
        if isAllIn(first: board[0][2], second: board[1][2], andThird: board[2][2]) {
            return .RightColumn
        }
        if isAllIn(first: board[0][0], second: board[1][1], andThird: board[2][2]) {
            return .BackwardDiagonal
        }
        if isAllIn(first: board[0][2], second: board[1][1], andThird: board[2][0]) {
            return .ForwardDiagonal
        }
        return .None
    }
    
    func isDraw() -> Bool {
        for row in board {
            if row.contains(Game.S) {
                return false
            }
        }
        return true
    }
}

var game: Game = Game()
