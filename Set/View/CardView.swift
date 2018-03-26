//
// Created by Maurizio Pietrantuono on 23/03/2018.
// Copyright (c) 2018 Maurizio Pietrantuono. All rights reserved.
//

import Foundation
import UIKit

class CardView: UIView {
    private let SMALL_INSET = CGFloat(2)
    private let MEDIUM_INSET = CGFloat(5)
    private let BIG_INSET = CGFloat(10)
    var card: Card? = nil
    public var isFaceUp = true

    init(card: Card) {
        super.init(frame: CGRect.zero)
        self.card = card
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func draw(_ rect: CGRect) {
        if (isFaceUp) {
            drawFace(rect: rect)
        } else {
        }
    }

    private func drawFace(rect: CGRect) {
        drawWhitebackGroud(rect: rect)
        drawSymbols()
    }

    private func drawSymbols() {
        let rects = getRecs()
        
        for rect in rects {
            let cardbackGround = UIBezierPath(roundedRect: rect, cornerRadius: CGFloat(10))
            UIColor.blue.setFill()
            cardbackGround.fill()
        }
    }

    private func getRecs() -> [CGRect] {
            let rect = getFrameWithInset(rect: bounds)
            let firstDivision = rect.divided(atDistance: rect.height / 3, from: CGRectEdge.minYEdge)
            let secondDivision = getHalf(rect: firstDivision.remainder)
            var rects: [CGRect] = [firstDivision.slice, secondDivision.slice, secondDivision.remainder]
            rects = addInsets(rects)
            return rects
    }

    private func addInsets(_ rects: [CGRect]) -> [CGRect] {
        var result: [CGRect] = []
        for rect in rects {
            result.append(rect.insetBy(dx: SMALL_INSET, dy: SMALL_INSET))
        }
        return result
    }

    private func getHalf(rect: CGRect) -> (slice: CGRect, remainder: CGRect) {
        let rects = rect.divided(atDistance: rect.height / 2, from: CGRectEdge.minYEdge)
        return rects
    }

    private func drawWhitebackGroud(rect: CGRect) {
        var inset = getFrameWithInset(rect: rect)
        let cardbackGround = UIBezierPath(roundedRect: inset, cornerRadius: MEDIUM_INSET)
        UIColor.white.setFill()
        cardbackGround.fill()
    }

    private func getFrameWithInset(rect: CGRect) -> CGRect {
        return rect.insetBy(dx: BIG_INSET, dy: BIG_INSET)
    }
}
