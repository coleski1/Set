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
    var chosenCards:[CardView] = []
    
    //from the old version of the game, still working out how to match cards
    func chooseCard(at index: Int){
        if cardsOnTable[index].selected == true {
            cardsOnTable[index].selected = false
            for pleaseCheck in 0...chosenCards.count {
                if chosenCards[pleaseCheck].hashValue == cardsOnTable[index].hashValue {
                    chosenCards.remove(at: pleaseCheck)
                    break
                }
            }
        } else if(chosenCards.count<3) {
            chosenCards.append(cardsOnTable[index])
            cardsOnTable[index].selected = true
        }
        
        if chosenCards.count==3{
            let card0 = chosenCards[0]
            let card1 = chosenCards[1]
            let card2 = chosenCards[2]
            
            print("cardColor: \(card0.color) \(card1.color) \(card2.color)")
            
            if ((card0.color == card1.color && card0.color == card2.color) || (card1.color != card2.color && card0.color != card1.color && card0.color != card2.color)) {
                print("made it past cardColor")
                
                if ((card0.number == card1.number && card0.number == card2.number)||(card0.number != card1.number && card0.number != card2.number && card1.number != card2.number)) {
                    
                    if((card0.alpha == card1.alpha && card0.alpha == card2.alpha)||((card1.alpha != card2.alpha  && card0.alpha != card1.alpha && card0.alpha != card2.alpha))) {
                        print("made it past the alpha")
                        
                        if ((card0.shape == card1.shape && card0.shape == card2.shape)||(card0.shape != card1.shape && card0.shape != card2.shape && card1.shape != card2.shape)) {
                            print("now through setTitle")
                            
                            for card in chosenCards {
                                card.partOfSet = true
                                card.isFaceUp = false
                                card.selected = false
                            }
                            score = score + 3
                            cardsOnTable.remove(at: cardsOnTable.index(of: card0)!)
                            cardsOnTable.remove(at: cardsOnTable.index(of: card1)!)
                            cardsOnTable.remove(at: cardsOnTable.index(of: card2)!)
                            
                            chosenCards.removeAll()
                            print("This is a match")
                            
                        } else {
                            for card in chosenCards {
                                card.selected = false
                            }
                            
                            score = score - 5
                            chosenCards.removeAll()
                        }
                    }
                }
            }
        }
    }
    var score = 0
    
    //array of all the cards
    public var cards = [Card]()
    public var cardsOnTable = [CardView]()
    
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
        
        shuffleCards()
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


