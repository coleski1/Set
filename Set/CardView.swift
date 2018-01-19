//
//  CardView.swift
//  Set
//
//  Created by Cole Turner on 1/18/18.
//  Copyright © 2018 Cole Turner. All rights reserved.
//

import UIKit

class CardView: UIView {

    
//    override func draw(_ rect: CGRect) {
//        let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius:cornerRadius)
//        roundedRect.addClip()
//        UIColor.white.setFill()
//        roundedRect.fill()
//        if isFaceUp {
//            if let faceCardImage = UIImage(named: rankString + suit, in: Bundle(for: self.classForCoder), compatibleWith: traitCollection ) {
//                faceCardImage.draw(in: bounds.zoom(by: faceCardScale))
//            } else  {
//                drawPips()
//            }
//        }else {
//            if let cardBackImage = UIImage(named: "cardback") {
//                cardBackImage.draw(in: bounds)
//            }
//        }    }
//
//}
//
//extension CardView {
//    //how to make constants
//    private struct SizeRatio {
//        static let cornerFontSizeToBoundsHeight: CGFloat = 0.085
//        static let cornerRadiusToBoundsHeight: CGFloat = 0.06
//        static let cornerOffsetToCornerRadius: CGFloat = 0.33
//        static let faceCardImageSizeToBoundsSize: CGFloat = 0.75
//    }
//    private var cornerRadius: CGFloat {
//        return bounds.size.height * SizeRatio.cornerRadiusToBoundsHeight
//    }
//    private var cornerOffset: CGFloat {
//        return cornerRadius * SizeRatio.cornerOffsetToCornerRadius
//    }
//    private var cornerFontSize: CGFloat{
//        return bounds.size.height * SizeRatio.cornerFontSizeToBoundsHeight
//    }
//    private var rankString: String {
//        switch rank {
//        case 1: return "A"
//        case 2...10: return String(rank)
//        case 11: return "J"
//        case 12: return "Q"
//        case 13: return "K"
//        default: return "?"
//        }
//    }
//}
//
//extension CGRect {
//    var leftHalf: CGRect {
//        return CGRect(x: minX, y: minY, width: width/2, height: height)
//    }
//
//    var rightHalf: CGRect {
//        return CGRect(x: midX, y: minY, width: width/2, height: height)
//    }
//    func inset(by size: CGSize) -> CGRect {
//        return insetBy(dx: size.width, dy: size.height)
//    }
//    func sized(to size: CGSize) -> CGRect {
//        return CGRect(origin: origin, size: size)
//    }
//    func zoom(by scale: CGFloat) -> CGRect {
//        let newWidth = width * scale
//        let newHeight = height * scale
//        return insetBy(dx: (width - newWidth)/2, dy:(height - newHeight)/2)
//    }
//}
//
//extension CGPoint {
//    func offsetBy(dx: CGFloat, dy: CGFloat) -> CGPoint {
//        return CGPoint(x: x+dx, y: y+dy)
//    }
}
