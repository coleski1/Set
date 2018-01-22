//
//  ViewController.swift
//  Set
//
//  Created by Cole Turner on 1/13/18.
//  Copyright © 2018 Cole Turner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var game = Set(/*numberOfSetsOfCards: 81 self.numberOfSetsOfCards*/) 

//    override func draw(_ rect: CGRect) {
//
//    }
    
    
    
    @IBOutlet weak var cardView: CardView! 
    
    
    
    //{
//        didSet {
//            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(nextCard))
//            swipe.direction = [.left,.right]
//            playingCardView.addGestureRecognizer(swipe)
//            let pinch = UIPinchGestureRecognizer(target: playingCardView, action: #selector(PlayingCardView.adjustFaceCardScale(byHandlingGestureRecognizedBy:)))
//            playingCardView.addGestureRecognizer(pinch)
//        }
   // }
    
    
    
    
    
    
    
    
    
//    private var startedGame = false
//
//    private var numberOfSetsOfCards: Int {
//        return (cardButtons.count+1)/3
//    }
////
//    @IBAction func newGame(_ sender: UIButton) {
//        startedGame = true
//
//        let newFunGame = Set(numberOfSetsOfCards: self.numberOfSetsOfCards)
//        for index in cardButtons.indices {
//            let card = game.cards[index]
//            card.isFaceUp = false
//        }
//        game = newFunGame
//        game.score = 0
//        updateViewFromModel()
//    }
//
//    @IBAction func dealThreeMore(_ sender: UIButton) {
//
//        if startedGame {
//            game.dealThreeMore()
//            updateViewFromModel()
//        }
//    }
//
//
//    @IBOutlet weak var scoreCounter: UILabel!
//
//    @IBOutlet var cardButtons: [UIButton]!
//
//    @IBAction func touchCard(_ sender: UIButton) {
//        if let cardNumber = cardButtons.index(of: sender), game.cards[cardNumber].isFaceUp {
//            game.chooseCard(at: cardNumber)
//            updateViewFromModel()
//        }
//    }
//
//    public func updateViewFromModel() {
//        for index in cardButtons.indices {
//            cardButtons[index].layer.cornerRadius = 8.0
//            let button = cardButtons[index]
//            let cardOfChoice = game.cards[index]
//            if cardOfChoice.selected {
//                cardButtons[index].layer.borderWidth = 3.0
//                cardButtons[index].layer.borderColor = UIColor.green.cgColor
//            } else {
//                cardButtons[index].layer.borderWidth = 0.0
//                cardButtons[index].layer.borderColor = UIColor.white.cgColor
//            }
//            if cardOfChoice.isFaceUp {
//                button.setAttributedTitle(cardOfChoice.attributedString, for: UIControlState.normal)
//                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//            } else if cardOfChoice.partOfSet{
//                button.setAttributedTitle(cardOfChoice.attributedString, for: UIControlState.normal)
//                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
//            } else {
//                button.setAttributedTitle(cardOfChoice.attributedString, for: UIControlState.normal)
//                button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//            }
//        }
//        scoreCounter.text = "Score: \(game.score)"
//    }
}


