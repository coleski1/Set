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
    
    
//    var description: String
    
    
//    static func ==(lhs: Card, rhs: Card) -> Bool {
//        return (
////            (lhs.number == rhs.number) &&
//                (lhs.Color == rhs.Color) &&
//                (lhs.Shape == rhs.Shape) &&
//                (lhs.CardAlpha == rhs.CardAlpha)
//        )
//    }
//    var description: String {return "\(self.cardColor)-\(Shape)-\(CardAlpha)"}

    
    
//    let diamond: UIImage = UIImage
//
//    let topCorner = CGPoint(
//
//
//
    enum Shape: String {

        case diamond = "▲"
        case oval = "●"
        case squiggle = "■"

        static var all = [Shape.diamond, .oval, .squiggle]

        var description: String { return rawValue}

    }
    
    enum Color: String {
        case green = "green"
        case red
        case blue

        static var all = [Color.green, .red, .blue]
    }
    
    enum CardAlpha: CGFloat {
        case full = 1.0
        case semi = 0.60
        case minor = 0.15
        
        static var all = [CardAlpha.full, .semi, .minor]
        
    }
    
    enum Number: Int {
        case one = 1
        case two
        case three
        
        static var all = [Number.one, .two, .three]
    }
    
    var cardColor = UIColor.green
    
//    var cardColor: UIColor = { (Color) -> UIColor in
//        if self.color == "green" {
//            return UIColor.green
//        } else if .color == "red" {
//            return UIColor.red
//        } else if .color == "blue" {
//            return UIColor.blue
//        } else {
//            return nil
//        }
//    }
    var strokeWidth = 1
    var whileCardIsFaceDown =  CGFloat(0.75)
    var alpha = CGFloat(0.0)
    var setMyTitle = ""

    var partOfSet = false

//    func willBeFaceUp() {
//        cardColor = UIColor.green
//    }
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

extension UIColor {
    convenience init(_ colorString: ColorString) {
        switch colorString {
        case .red:
            self.init(red:1.0, green:0.0, blue:0.0, alpha:1.0)
        case .green:
            self.init(red:0.0, green:1.0, blue:0.0, alpha:1.0)
        case .blue:
            self.init(red:0.0, green:0.0, blue:1.0, alpha:1.0)
        }
    }
    enum ColorString: String  {
        case red
        case green
        case blue
    }
}
