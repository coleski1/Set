//
//  Card.swift
//  Set
//
//  Created by Cole Turner on 1/14/18.
//  Copyright © 2018 Cole Turner. All rights reserved.
//

import Foundation
import UIKit

class Card: Hashable {
    
    var hashValue: Int { return identifier}
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var cardColor: UIColor = UIColor.red
    var strokeWidth = 1
    var whileCardIsFaceDown =  CGFloat(0.75)
    var alpha = CGFloat(0.0)
    var setMyTitle = ""

    var partOfSet = false
    
    func willBeFaceUp() {
        cardColor = UIColor.green
    }
    var isFaceUp = false
    var selected = false
    private var identifier: Int
    
    lazy var attributedString = NSMutableAttributedString(
        string: setMyTitle,
        attributes: [NSAttributedStringKey.strokeWidth:strokeWidth,
                     NSAttributedStringKey.foregroundColor: cardColor.withAlphaComponent(alpha)])
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier  = Card.getUniqueIdentifier()
    }
}
