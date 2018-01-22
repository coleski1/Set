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
    
    //array of cards that were chosen so I can match sets
    var chosenCards:[Card] = []
    
    //from the old version of the game, still working out how to match cards
    func chooseCard(at index: Int){
//        if cards[index].selected == true {
//           cards[index].selected = false
//            for pleaseCheck in 0...chosenCards.count {
//                if chosenCards[pleaseCheck].hashValue == cards[index].hashValue {
//                    chosenCards.remove(at: pleaseCheck)
//                    break
//                }
//            }
//        } else if(chosenCards.count<3) {
//            chosenCards.append(cards[index])
//            cards[index].selected = true
//        }
//
//        if chosenCards.count==3{
//            let card0 = chosenCards[0]
//            let card1 = chosenCards[1]
//            let card2 = chosenCards[2]
//
//            print("cardColor: \(card0.cardColor) \(card1.cardColor) \(card2.cardColor)")
//
//            if ((card0.cardColor == card1.cardColor && card0.cardColor == card2.cardColor) || (card1.cardColor != card2.cardColor && card0.cardColor != card1.cardColor && card0.cardColor != card2.cardColor)) {
//                print("made it past cardColor")
//
//
//                if((card0.alpha == card1.alpha && card0.alpha == card2.alpha)||((card0.alpha != card1.alpha) || (Int(card0.alpha + 0.001) != card1.strokeWidth) && (card0.alpha != card2.alpha) || (Int(card0.alpha + 0.001) != card2.strokeWidth) && (card1.alpha != card2.alpha) || (Int(card1.alpha + 0.001) != card2.strokeWidth))) {
//                    print("made it past the alpha")
//
//                    if ((card0.setMyTitle == card1.setMyTitle && card0.setMyTitle == card2.setMyTitle)||(card0.setMyTitle != card1.setMyTitle && card0.setMyTitle != card2.setMyTitle && card1.setMyTitle != card2.setMyTitle)) {
//                        print("now through setTitle")
//
//                        for card in chosenCards {
//                            card.partOfSet = true
//                            card.isFaceUp = false
//                            card.selected = false
//                        }
//                        score = score + 3
//                        chosenCards.removeAll()
//                        print("This is a match")
//
//                    } else {
//                        for card in chosenCards {
//                            card.selected = false
//                        }
//
//                        score = score - 5
//                        chosenCards.removeAll()
//                    }
//                } else {
//
//                }
//            } else {
//                for card in chosenCards {
//                    card.selected = false
//                }
//
//                score = score - 5
//                chosenCards.removeAll()
//            }
//        }
    }
    var score = 0
    
    //array of all the cards
    private(set) var cards = [Card]()

    //gets one of each type to make 81
    init() {
        for num in Card.Number.all {
            for geometry in Card.Shape.all {
                for shade in Card.CardAlpha.all {
                    for look in Card.Color.all {
                        cards.append(Card(geometry: geometry, look: look, shade: shade, num: num))
                    }
                }
            }
        }
        
        for index in 0...11 {
            cards[index].isFaceUp = true
        }
        shuffleCards()
    }
    
    //deals three more cards from the array of them
    public func dealThreeMore() {
        var hasBeenFlippedOver = 0
        for index in 0...cards.count-1 {
            if cards[index].isFaceUp==false&&hasBeenFlippedOver<3&&cards[index].partOfSet==false{
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



//creates a random integer, from lecture code
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


