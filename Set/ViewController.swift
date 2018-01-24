//
//  ViewController.swift
//  Set
//
//  Created by Cole Turner on 1/13/18.
//  Copyright © 2018 Cole Turner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //init
    private var game = Set()
    var index = 0
    lazy var grid = Grid(layout: Grid.Layout.aspectRatio(5/8), frame: mainView.bounds)
    private var selectedCards = [CardView]()
    @IBOutlet weak var scoreCounter: UILabel!
    
    //the big background view that the grid is written onto
    @IBOutlet weak var mainView: MainView! {
        didSet {
            dealCards()
            updateViewFromModel()
        }
    }
    
    //for the newGame button
    @IBAction func newGame(_ sender: UIButton) {
        game.cardsOnTable.forEach {
            $0.removeFromSuperview()
        }
        game.cardsOnTable.removeAll()
        let newFunGame = Set()
        game = newFunGame
        game.score = 0
        dealCards()
        updateViewFromModel()
    }

    //for the deal three more button
    @IBAction func dealThreeMore(_ sender: UIButton) {
       outsideDealThreeMore()
    }
    
    //updates the view of the game
    public func updateViewFromModel() {
        for index in game.cardsOnTable.indices {
            let insetXY = (grid[index]?.height ?? 400)/100
            game.cardsOnTable[index].frame = grid[index]?.insetBy(dx: insetXY, dy: insetXY) ?? CGRect.zero
        }
        if scoreCounter != nil {scoreCounter.text! = "Score: \(game.score)"}
    }
    
    //deals all the cards needed at the beginning
    private func dealCards() {
        for _ in 0...3 {
            outsideDealThreeMore()
        }
    }
    
    //deals 3 random cards
    private func outsideDealThreeMore() {
        if game.cards.count > 2 {
            let tableCount = game.cardsOnTable.count + 2
            
            for index in game.cardsOnTable.count...game.cardsOnTable.count + 2 {
                game.cards[tableCount - index].isFaceUp = true
                game.cardsOnTable.append(CardView())
                game.cardsOnTable[index].color = game.cards[tableCount - index].color.rawValue
                game.cardsOnTable[index].cardAlpha = game.cards[tableCount - index].cardAlpha.rawValue
                game.cardsOnTable[index].number = game.cards[tableCount - index].number.rawValue
                game.cardsOnTable[index].shape = game.cards[tableCount - index].shape.rawValue
                grid.cellCount = game.cardsOnTable.count
                game.cardsOnTable[index].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(chooseCard)))
                
                mainView.addSubview(game.cardsOnTable[index])
            }
            for index in 0...2 {
                game.cards.remove(at: 2 - index)
            }
        }
        
        updateViewFromModel()
    }
    
    //chooses the card that was clicked on
    @objc func chooseCard(_ recognizer: UITapGestureRecognizer) {
        guard let tappedCard = recognizer.view as? CardView else { return }
        
        let cardIndex = game.cardsOnTable.index(of: tappedCard)
        game.chooseCard(at: cardIndex!)
        updateViewFromModel()
    }
}

struct LayOutMetricsForCardView {
    static var borderWidth: CGFloat = 1.0
    static var borderWidthIfSelected: CGFloat = 4.0
    static var borderColorIfSelected: CGColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1).cgColor

    static var borderWidthIfHinted: CGFloat = 4.0
    static var borderColorIfHinted: CGColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1).cgColor

    static var borderWidthIfMatched: CGFloat = 4.0
    static var borderColorIfMatched: CGColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1).cgColor

    static var borderColor: CGColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor
    static var borderColorForDrawButton: CGColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor
    static var borderWidthForDrawButton: CGFloat = 3.0
    static var cornerRadius: CGFloat = 8.0
}


