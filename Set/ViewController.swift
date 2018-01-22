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
    @IBOutlet weak var cardView: CardView! {
        didSet {
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(nextCard))
            swipe.direction = [.left,.right]
            cardView.addGestureRecognizer(swipe)
//            let pinch = UIPinchGestureRecognizer(target: playingCardView, action: #selector(cardView.adjustFaceCardScale(byHandlingGestureRecognizedBy:)))
//            cardView.addGestureRecognizer(pinch)
        }
    }
    
    //choose the next card from the deck
    @objc func nextCard() {
        if index < 81 {
            print(game.cards[index].description)
            cardView.color = game.cards[index].color.rawValue
            cardView.cardAlpha = game.cards[index].cardAlpha.rawValue
            cardView.number = game.cards[index].number.rawValue
            cardView.shape = game.cards[index].shape.rawValue
            index += 1
        }
    }
    
//    var grid = Grid(layout: .dimensions(rowCount: 3, columnCount: 4), frame: cardView)



    //for the newGame button that is on hiatus
    @IBAction func newGame(_ sender: UIButton) {
        startedGame = true

        let newFunGame = Set()
        for index in cardButtons.indices {
            let card = game.cards[index]
            card.isFaceUp = false
        }
        game = newFunGame
        game.score = 0
        updateViewFromModel()
    }

    //for the deal three more button that is also on hiatus
    @IBAction func dealThreeMore(_ sender: UIButton) {

        if startedGame {
            game.dealThreeMore()
            updateViewFromModel()
        }
    }
    
    @IBOutlet weak var scoreCounter: UILabel!

    @IBOutlet var cardButtons: [UIButton]!

    //for when the card is tapped but out of date since I changed the storyboard
    @IBAction func touchCard(_ sender: UIButton) {
//        print("card was touched")
//        updateViewFromModel()
//        if let cardNumber = cardButtons.index(of: sender), game.cards[cardNumber].isFaceUp {
//            game.chooseCard(at: cardNumber)
//            updateViewFromModel()
//        }
    }

    //also out of date since I changed the storyboard but used to update the game
    public func updateViewFromModel() {
        
        cardView.color = game.cards[index].color.rawValue
        cardView.cardAlpha = game.cards[index].cardAlpha.rawValue
        cardView.number = game.cards[index].number.rawValue
        cardView.shape = game.cards[index].shape.rawValue
        index += 1
        for index in cardButtons.indices {
            cardButtons[index].layer.cornerRadius = 8.0
            let button = cardButtons[index]
            let cardOfChoice = game.cards[index]
            if cardOfChoice.selected {
                cardButtons[index].layer.borderWidth = 3.0
                cardButtons[index].layer.borderColor = UIColor.green.cgColor
            } else {
                cardButtons[index].layer.borderWidth = 0.0
                cardButtons[index].layer.borderColor = UIColor.white.cgColor
            }
            if cardOfChoice.isFaceUp {
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else if cardOfChoice.partOfSet{
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
            } else {
                button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            }
        }
        scoreCounter.text = "Score: \(game.score)"
    }
}


