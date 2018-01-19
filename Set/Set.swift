//
//  Set.swift
//  Set
//
//  Created by Cole Turner on 1/14/18.
//  Copyright © 2018 Cole Turner. All rights reserved.
//

import Foundation
import UIKit
class Set {
    
    var chosenCards:[Card] = []
    
    func chooseCard(at index: Int){
        if cards[index].selected == true {
           cards[index].selected = false
            for pleaseCheck in 0...chosenCards.count {
                if chosenCards[pleaseCheck].hashValue == cards[index].hashValue {
                    chosenCards.remove(at: pleaseCheck)
                    break
                }
            }
        } else if(chosenCards.count<3) {
            chosenCards.append(cards[index])
            cards[index].selected = true
        }
        
        if chosenCards.count==3{
            let card0 = chosenCards[0]
            let card1 = chosenCards[1]
            let card2 = chosenCards[2]
            
            print("cardColor: \(card0.cardColor) \(card1.cardColor) \(card2.cardColor)")
            
            if ((card0.cardColor == card1.cardColor && card0.cardColor == card2.cardColor) || (card1.cardColor != card2.cardColor && card0.cardColor != card1.cardColor && card0.cardColor != card2.cardColor)) {
                print("made it past cardColor")
                
                
                if((card0.alpha == card1.alpha && card0.alpha == card2.alpha)||((card0.alpha != card1.alpha) || (Int(card0.alpha + 0.001) != card1.strokeWidth) && (card0.alpha != card2.alpha) || (Int(card0.alpha + 0.001) != card2.strokeWidth) && (card1.alpha != card2.alpha) || (Int(card1.alpha + 0.001) != card2.strokeWidth))) {
                    print("made it past the alpha")
                    
                    if ((card0.setMyTitle == card1.setMyTitle && card0.setMyTitle == card2.setMyTitle)||(card0.setMyTitle != card1.setMyTitle && card0.setMyTitle != card2.setMyTitle && card1.setMyTitle != card2.setMyTitle)) {
                        print("now through setTitle")
                        
                        for card in chosenCards {
                            card.partOfSet = true
                            card.isFaceUp = false
                            card.selected = false
                        }
                        score = score + 3
                        chosenCards.removeAll()
                        print("This is a match")
                        
                    } else {
                        for card in chosenCards {
                            card.selected = false
                        }
                        
                        score = score - 5
                        chosenCards.removeAll()
                    }
                } else {
                    for card in chosenCards {
                        card.selected = false
                    }
                    
                    score = score - 5
                    chosenCards.removeAll()
                }
            } else {
                for card in chosenCards {
                    card.selected = false
                }
                
                score = score - 5
                chosenCards.removeAll()
            }
        }
    }
    var score = 0
    
    private(set) var cards = [Card]()
    var shapes = ["○","□","△"]
    var opacities = [CGFloat(0.15),CGFloat(0.999),1]
    var colors = [UIColor.red, UIColor.blue, UIColor.magenta]


    init(numberOfSetsOfCards: Int) {
        for _ in 1...(numberOfSetsOfCards)*3 {
            let card = Card()
            cards.append(card)
        }
        print("the number of cards in cards is: \(cards.count)")
        print("the number of sets of cards is: \(numberOfSetsOfCards)")
        
        
        for card in cards {
            let shapesRandomInt = Int(arc4random_uniform(UInt32(shapes.count)))
            let opacitiesRandomInt = Int(arc4random_uniform(UInt32(opacities.count)))
            let colorsRandomInt = Int(arc4random_uniform(UInt32(colors.count)))
            
            card.cardColor = colors[colorsRandomInt]
            card.setMyTitle = shapes[shapesRandomInt]
            card.alpha = opacities[opacitiesRandomInt]
            
            if card.alpha == 1 {
                card.strokeWidth = 1
                card.alpha = CGFloat(1.0)
            } else if card.alpha < 1 {
                card.strokeWidth = -1
            }
        }
//        for index in stride(from: 0,to: cards.count, by: 3){
//            cards[index].setMyTitle = shapes[0]
//            cards[index].alpha = opacities[0]
//            cards[index].cardColor = colors[0]
//        }
//        for index in stride(from: 1,to: cards.count, by: 3){
//            cards[index].setMyTitle = shapes[1]
//            cards[index].alpha = opacities[1]
//            cards[index].cardColor = colors[1]
//        }
//        for index in stride(from: 2,to: cards.count, by: 3){
//            cards[index].setMyTitle = shapes[2]
//            cards[index].strokeWidth = Int(opacities[2])
//            cards[index].cardColor = colors[2]
//        }
        
        for index in 0...11 {
            cards[index].isFaceUp = true
        }
        shuffleCards()
    }
    
    public func dealThreeMore() {
        var hasBeenFlippedOver = 0
        for index in 0...cards.count-1 {
            if cards[index].isFaceUp==false&&hasBeenFlippedOver<3&&cards[index].partOfSet==false{
                cards[index].cardColor = UIColor.green
                cards[index].alpha = cards[index].whileCardIsFaceDown
                cards[index].isFaceUp = true
                hasBeenFlippedOver+=1
            }
        }
    }
    
    //shuffle the cards
    private func shuffleCards() {
        var cardsShuffled = [Card]()
        for _ in cards {
            let randomNum = Int(arc4random_uniform(UInt32(cards.count)))
            
            cardsShuffled.append(cards[randomNum])
            cards.remove(at: randomNum)
        }
        
        cards = cardsShuffled
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return  Int(arc4random_uniform(UInt32(self)))
            
        } else if  self < 0 {
            return  -Int(arc4random_uniform(UInt32(abs(self))))
            
        } else {
            return 0
        }
    }
}


