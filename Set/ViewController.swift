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
    //so that certain things load in properly at the beginning
    private var startedGame = false
    
    //swipe gesture
    @IBOutlet weak var mainView: MainView! {
        didSet {
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(nextCard))
            swipe.direction = [.left,.right]
            mainView.addGestureRecognizer(swipe)
//            let pinch = UIPinchGestureRecognizer(target: playingCardView, action: #selector(cardView.adjustFaceCardScale(byHandlingGestureRecognizedBy:)))
//            cardView.addGestureRecognizer(pinch)
            dealCards()
            updateViewFromModel()
        }
    }
    
    //choose the next card from the deck
    @objc func nextCard() {
        if index < game.cardsOnTable.count {
            print(game.cardsOnTable[index].description)
            //cardView = game.cardsOnTable[index]
            index += 1
        }
    }
    
//    var grid = Grid(layout: .dimensions(rowCount: 3, columnCount: 4), frame: cardView)



    //for the newGame button that is on hiatus
    @IBAction func newGame(_ sender: UIButton) {
        startedGame = true

        let newFunGame = Set()
        for _ in cardButtons.indices {
            //let card = game.cardsOnTable[index]
            //card.isFaceUp = false
        }
        game = newFunGame
        game.score = 0
        updateViewFromModel()
    }

    //for the deal three more button that is also on hiatus
    @IBAction func dealThreeMore(_ sender: UIButton) {

        if startedGame {
            dealThreeMore()
            updateViewFromModel()
        }
    }
    
    @IBOutlet weak var scoreCounter: UILabel!

    @IBOutlet var cardButtons: [UIButton]!

    //for when the card is tapped but out of date since I changed the storyboard
    @IBAction func touchCard(_ sender: UIButton) {
        print("card was touched")
//        updateViewFromModel()
//        if let cardNumber = cardButtons.index(of: sender), game.cardsOnTable[cardNumber].isFaceUp {
//            game.chooseCard(at: cardNumber)
//            updateViewFromModel()
//        }
    }

    //also out of date since I changed the storyboard but used to update the game
    public func updateViewFromModel() {
        let grid = Grid(layout: Grid.Layout.aspectRatio(0.7), frame: mainView.bounds)
        for index in game.cardsOnTable.indices {
            let insetXY = (grid[index]?.height ?? 400)/100
            print(game.cardsOnTable[index].frame.midX)
            game.cardsOnTable[index].frame = grid[index]!.insetBy(dx: insetXY, dy: insetXY) //?? CGRect.zero
            print(game.cardsOnTable[index].frame.midX)

        }
    }
    
    private func dealCards() {
        for index in 0...11 {
            game.cards[index].isFaceUp = true
            game.cardsOnTable.append(CardView())
            game.cardsOnTable[index].color = game.cards[index].color.rawValue
            game.cardsOnTable[index].cardAlpha = game.cards[index].cardAlpha.rawValue
            game.cardsOnTable[index].number = game.cards[index].number.rawValue
            game.cardsOnTable[index].shape = game.cards[index].shape.rawValue
            
            mainView.addSubview(game.cardsOnTable[index])

        }
        
        for index in 0...11 {
            game.cards.remove(at: index)
        }
    }
    
    //deals three more cards from the array of them
    public func dealThreeMore() {
        for index in 0...3 {
            game.cards[index].isFaceUp = true
            game.cardsOnTable.append(CardView())
            game.cardsOnTable[index].color = game.cards[index].color.rawValue
            game.cardsOnTable[index].cardAlpha = game.cards[index].cardAlpha.rawValue
            game.cardsOnTable[index].number = game.cards[index].number.rawValue
            game.cardsOnTable[index].shape = game.cards[index].shape.rawValue
            mainView.addSubview(game.cardsOnTable[index])
            
        }
        
        for index in 0...3 {
            game.cards.remove(at: index)
        }
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


