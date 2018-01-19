//
//  CardView.swift
//  Set
//
//  Created by Cole Turner on 1/18/18.
//  Copyright © 2018 Cole Turner. All rights reserved.
//

import UIKit

@IBDesignable
class CardView: UIButton {
    
    @IBInspectable
    var rank: Int = 10 { didSet { setNeedsDisplay(); setNeedsLayout() }}
    
    @IBInspectable
    var suit: String = "♥️" { didSet { setNeedsDisplay(); setNeedsLayout() }}
    
    @IBInspectable
    var isFaceUp: Bool = true { didSet { setNeedsDisplay(); setNeedsLayout() }}
    
    var faceCardScale: CGFloat = SizeRatio.faceCardImageSizeToBoundsSize { didSet { setNeedsDisplay() } }
    
    var rankString = "10"
    
    @objc func adjustFaceCardScale(byHandlingGestureRecognizedBy recognizer: UIPinchGestureRecognizer) {
        switch recognizer.state {
        case .changed, .ended: faceCardScale *= recognizer.scale
        default: break
        }
    }

    
    override func draw(_ rect: CGRect) {
        
        let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius:cornerRadius)
        roundedRect.addClip()
        UIColor.white.setFill()
        roundedRect.fill()
        
        let path = UIBezierPath()
        path.addArc(withCenter: CGPoint(x: bounds.midX - bounds.midX/2, y: bounds.midY), radius: radius, startAngle: 3*CGFloat.pi/2, endAngle: CGFloat.pi/2, clockwise: false)
        path.addArc(withCenter: CGPoint(x: bounds.midX + bounds.midX/2, y: bounds.midY), radius: radius, startAngle: CGFloat.pi/2, endAngle: 3*CGFloat.pi/2, clockwise: false)
        path.lineWidth = 3.0
        path.close()
        UIColor.blue.setFill()
        UIColor.red.setStroke()
        path.stroke()
        path.fill()
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
//        }
        
    }
    
    private func centeredAttributedString(_ string: String, fontSize: CGFloat) -> NSAttributedString {
        var font = UIFont.preferredFont(forTextStyle: .body).withSize(fontSize)
        font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        return NSAttributedString(string: string, attributes: [.paragraphStyle:paragraphStyle,.font:font])
    }
    
    private var cornerString: NSAttributedString {
        return centeredAttributedString(rankString+"\n"+suit, fontSize: cornerFontSize)
    }
    
    private lazy var upperLeftCornerLabel = createCornerLabel()
    private lazy var lowerRightCornerLabel = createCornerLabel()
    
    private func createCornerLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        addSubview(label)
        return label
    }
    
    private func configureCornerLabel( _ label: UILabel) {
        label.attributedText = cornerString
        label.frame.size = CGSize.zero
        label.sizeToFit()
//        label.isHidden = !isFaceUp
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setNeedsDisplay()
        setNeedsLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        configureCornerLabel(upperLeftCornerLabel)
        upperLeftCornerLabel.frame.origin = bounds.origin.offsetBy(dx: cornerOffset, dy: cornerOffset)
        
        
        configureCornerLabel(lowerRightCornerLabel)
        lowerRightCornerLabel.transform = CGAffineTransform.identity
            .translatedBy(x: lowerRightCornerLabel.frame.size.width, y: lowerRightCornerLabel.frame.size.height)
            .rotated(by: CGFloat.pi)
        lowerRightCornerLabel.frame.origin = CGPoint(x: bounds.maxX, y:bounds.maxY)
            .offsetBy(dx: -cornerOffset, dy: -cornerOffset)
            .offsetBy(dx: -lowerRightCornerLabel.frame.size.width, dy: -lowerRightCornerLabel.frame.size.height)
    }
    
    //draws an oval
//        override func draw(_ rect: CGRect) {
//            let path = UIBezierPath()
//            path.addArc(withCenter: CGPoint(x: bounds.midX - bounds.midX/2, y: bounds.midY), radius: radius, startAngle: 3*CGFloat.pi/2, endAngle: CGFloat.pi/2, clockwise: false)
//            path.addArc(withCenter: CGPoint(x: bounds.midX + bounds.midX/2, y: bounds.midY), radius: radius, startAngle: CGFloat.pi/2, endAngle: 3*CGFloat.pi/2, clockwise: false)
//            path.lineWidth = 3.0
//            path.close()
//            UIColor.blue.setFill()
//            UIColor.red.setStroke()
//            path.stroke()
//            path.fill()
//        }
    
    //creates three ovals
    //    override func draw(_ rect: CGRect) {
    //        let path = UIBezierPath()
    //        path.addArc(withCenter: CGPoint(x: bounds.midX - bounds.midX/2, y: bounds.midY), radius: radius, startAngle: 3*CGFloat.pi/2, endAngle: CGFloat.pi/2, clockwise: false)
    //        path.addArc(withCenter: CGPoint(x: bounds.midX + bounds.midX/2, y: bounds.midY), radius: radius, startAngle: CGFloat.pi/2, endAngle: 3*CGFloat.pi/2, clockwise: false)
    //        path.lineWidth = 3.0
    //        path.close()
    //        UIColor.blue.setFill()
    //        UIColor.red.setStroke()
    //        path.stroke()
    //        path.fill()
    //        path.addArc(withCenter: CGPoint(x: bounds.midX - bounds.midX/2, y: bounds.midY), radius: radius, startAngle: 3*CGFloat.pi/2, endAngle: CGFloat.pi/2, clockwise: false)
    //
    //        let secondPath = UIBezierPath()
    //        secondPath.addArc(withCenter: CGPoint(x: bounds.midX - bounds.midX/2, y: bounds.midY + radius*3), radius: radius, startAngle: 3*CGFloat.pi/2, endAngle: CGFloat.pi/2, clockwise: false)
    //
    //        secondPath.addArc(withCenter: CGPoint(x: bounds.midX + bounds.midX/2, y: bounds.midY + radius*3), radius: radius, startAngle: CGFloat.pi/2, endAngle: 3*CGFloat.pi/2, clockwise: false)
    //        secondPath.lineWidth = 3.0
    //        secondPath.close()
    //        UIColor.blue.setFill()
    //        UIColor.red.setStroke()
    //        secondPath.stroke()
    //        secondPath.fill()
    //
    //        let thirdPath = UIBezierPath()
    //        thirdPath.addArc(withCenter: CGPoint(x: bounds.midX - bounds.midX/2, y: bounds.midY - radius*3), radius: radius, startAngle: 3*CGFloat.pi/2, endAngle: CGFloat.pi/2, clockwise: false)
    //
    //        thirdPath.addArc(withCenter: CGPoint(x: bounds.midX + bounds.midX/2, y: bounds.midY - radius*3), radius: radius, startAngle: CGFloat.pi/2, endAngle: 3*CGFloat.pi/2, clockwise: false)
    //        thirdPath.lineWidth = 3.0
    //        thirdPath.close()
    //        UIColor.blue.setFill()
    //        UIColor.red.setStroke()
    //        thirdPath.stroke()
    //        thirdPath.fill()
    //
    //    }
    //draws a diamond
    //    override func draw(_ rect: CGRect) {
    //        let path = UIBezierPath()
    //        path.move(to: CGPoint(x: bounds.midX - bounds.midX/2 - radius, y: bounds.midY))
    //        path.addLine(to: CGPoint(x: bounds.midX, y: bounds.midY - radius))
    //        path.addLine(to: CGPoint(x: bounds.midX + bounds.midX/2 + radius, y:bounds.midY))
    //        path.addLine(to: CGPoint(x: bounds.midX, y: bounds.midY + radius))
    //        path.close()
    //
    //        path.lineWidth = 5.0
    //        UIColor.red.setStroke()
    //        UIColor.blue.setFill()
    //        path.stroke()
    //        path.fill()
    //
    //    }
    //
    //three diamonds
    //    override func draw(_ rect: CGRect) {
    //        let path = UIBezierPath()
    //        path.move(to: CGPoint(x: bounds.midX - bounds.midX/2 - radius, y: bounds.midY + radius*3))
    //        path.addLine(to: CGPoint(x: bounds.midX, y: bounds.midY - radius + radius*3))
    //        path.addLine(to: CGPoint(x: bounds.midX + bounds.midX/2 + radius, y:bounds.midY + radius*3))
    //        path.addLine(to: CGPoint(x: bounds.midX, y: bounds.midY + radius + radius*3))
    //        path.close()
    //
    //        path.lineWidth = 3.0
    //        UIColor.red.setStroke()
    //        UIColor.blue.setFill()
    //        path.stroke()
    //        path.fill()
    //
    //        let secondPath = UIBezierPath()
    //        secondPath.move(to: CGPoint(x: bounds.midX - bounds.midX/2 - radius, y: bounds.midY))
    //        secondPath.addLine(to: CGPoint(x: bounds.midX, y: bounds.midY - radius))
    //        secondPath.addLine(to: CGPoint(x: bounds.midX + bounds.midX/2 + radius, y:bounds.midY))
    //        secondPath.addLine(to: CGPoint(x: bounds.midX, y: bounds.midY + radius))
    //        secondPath.close()
    //
    //        secondPath.lineWidth = 3.0
    //        UIColor.red.setStroke()
    //        UIColor.blue.setFill()
    //        secondPath.stroke()
    //        secondPath.fill()
    //
    //        let thirdPath = UIBezierPath()
    //        thirdPath.move(to: CGPoint(x: bounds.midX - bounds.midX/2 - radius, y: bounds.midY - radius*3))
    //        thirdPath.addLine(to: CGPoint(x: bounds.midX, y: bounds.midY - radius - radius*3))
    //        thirdPath.addLine(to: CGPoint(x: bounds.midX + bounds.midX/2 + radius, y:bounds.midY - radius*3))
    //        thirdPath.addLine(to: CGPoint(x: bounds.midX, y: bounds.midY + radius - radius*3))
    //        thirdPath.close()
    //
    //        thirdPath.lineWidth = 3.0
    //        UIColor.red.setStroke()
    //        UIColor.blue.setFill()
    //        thirdPath.stroke()
    //        thirdPath.fill()
    //
    //    }
    
    // this draws a squiggly
    //    override func draw(_ rect: CGRect) {
    //        let path = UIBezierPath()
    //        path.addArc(withCenter: CGPoint(x: bounds.midX - bounds.midX/2, y: bounds.midY - radius/2), radius: radius, startAngle: 0, endAngle: CGFloat.pi/2, clockwise: false)
    //        path.addArc(withCenter: CGPoint(x: bounds.midX + bounds.midX/2, y: bounds.midY + radius - radius/2), radius: radius, startAngle: CGFloat.pi, endAngle: 3*CGFloat.pi/2, clockwise: false)
    //        path.lineWidth = 3.0
    //        path.close()
    //        UIColor.blue.setFill()
    //        UIColor.red.setStroke()
    //        path.stroke()
    //        path.fill()
    //    }
    
    //draws three squigglies
    //    override func draw(_ rect: CGRect) {
    //        let path = UIBezierPath()
    //        path.addArc(withCenter: CGPoint(x: bounds.midX - bounds.midX/2, y: bounds.midY - radius/2), radius: radius, startAngle: 0, endAngle: CGFloat.pi/2, clockwise: false)
    //        path.addArc(withCenter: CGPoint(x: bounds.midX + bounds.midX/2, y: bounds.midY + radius - radius/2), radius: radius, startAngle: CGFloat.pi, endAngle: 3*CGFloat.pi/2, clockwise: false)
    //        path.lineWidth = 3.0
    //        path.close()
    //        UIColor.blue.setFill()
    //        UIColor.red.setStroke()
    //        path.stroke()
    //        path.fill()
    //
    //        let secondPath = UIBezierPath()
    //        secondPath.addArc(withCenter: CGPoint(x: bounds.midX - bounds.midX/2, y: bounds.midY - radius*3 - radius/2), radius: radius, startAngle: 0, endAngle: CGFloat.pi/2, clockwise: false)
    //        secondPath.addArc(withCenter: CGPoint(x: bounds.midX + bounds.midX/2, y: bounds.midY + radius  - radius*3 - radius/2), radius: radius, startAngle: CGFloat.pi, endAngle: 3*CGFloat.pi/2, clockwise: false)
    //        secondPath.lineWidth = 3.0
    //        secondPath.close()
    //        UIColor.blue.setFill()
    //        UIColor.red.setStroke()
    //        secondPath.stroke()
    //        secondPath.fill()
    //
    //        let thirdPath = UIBezierPath()
    //        thirdPath.addArc(withCenter: CGPoint(x: bounds.midX - bounds.midX/2, y: bounds.midY + radius*3 - radius/2), radius: radius, startAngle: 0, endAngle: CGFloat.pi/2, clockwise: false)
    //        thirdPath.addArc(withCenter: CGPoint(x: bounds.midX + bounds.midX/2, y: bounds.midY + radius  + radius*3 - radius/2), radius: radius, startAngle: CGFloat.pi, endAngle: 3*CGFloat.pi/2, clockwise: false)
    //        thirdPath.lineWidth = 3.0
    //        thirdPath.close()
    //        UIColor.blue.setFill()
    //        UIColor.red.setStroke()
    //        thirdPath.stroke()
    //        thirdPath.fill()
    //    }
    


}



extension CardView {
    //how to make constants
    private struct SizeRatio {
        static let radiusBounds: CGFloat = 0.10
        static let cornerFontSizeToBoundsHeight: CGFloat = 0.085
        static let cornerRadiusToBoundsHeight: CGFloat = 0.06
        static let cornerOffsetToCornerRadius: CGFloat = 0.33
        static let faceCardImageSizeToBoundsSize: CGFloat = 0.75
    }
    private var radius: CGFloat {
        return bounds.size.height * SizeRatio.radiusBounds
    }
    private var cornerRadius: CGFloat {
        return bounds.size.height * SizeRatio.cornerRadiusToBoundsHeight
    }
    private var cornerOffset: CGFloat {
        return cornerRadius * SizeRatio.cornerOffsetToCornerRadius
    }
    private var cornerFontSize: CGFloat{
        return bounds.size.height * SizeRatio.cornerFontSizeToBoundsHeight
    }
}

extension CGRect {
    var leftHalf: CGRect {
        return CGRect(x: minX, y: minY, width: width/2, height: height)
    }

    var rightHalf: CGRect {
        return CGRect(x: midX, y: minY, width: width/2, height: height)
    }
    func inset(by size: CGSize) -> CGRect {
        return insetBy(dx: size.width, dy: size.height)
    }
    func sized(to size: CGSize) -> CGRect {
        return CGRect(origin: origin, size: size)
    }
    func zoom(by scale: CGFloat) -> CGRect {
        let newWidth = width * scale
        let newHeight = height * scale
        return insetBy(dx: (width - newWidth)/2, dy:(height - newHeight)/2)
    }
}

extension CGPoint {
    func offsetBy(dx: CGFloat, dy: CGFloat) -> CGPoint {
        return CGPoint(x: x+dx, y: y+dy)
    }
}
