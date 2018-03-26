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
            drawShapeInRec(rect)
        }
    }

    private func drawShapeInRec(_ rect: CGRect) {
        let shape = getShape(rect)
        colorShape()
        fillShape(shape)
    }

    private func getShape(_ rect: CGRect) -> UIBezierPath {
        if (card?.shape == Shape.FIRST) {
            return getDiamond(rect)
        }
        if (card?.shape == Shape.SECOND) {
            return getDiamond(rect)
        }
        if (card?.shape == Shape.THIRD) {
            return getDiamond(rect)
        }
        fatalError("Invalid shape")
    }

    private func getDiamond(_ rect: CGRect) -> UIBezierPath {
        let path = UIBezierPath()
        let halfY = rect.minY + rect.height / 2
        let halfX = rect.minX + rect.width / 2
        let startPoint = CGPoint(x: rect.minX, y: halfY)
        path.move(to: startPoint)
        path.addLine(to: CGPoint(x: halfX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: halfY))
        path.addLine(to: CGPoint(x: halfX, y: rect.maxY))
        path.close()
        return path
    }

    private func fillShape(_ shape: UIBezierPath) {
        shape.fill()
    }

    private func colorShape() {
        UIColor.red.setFill()
    }

    private func getRecs() -> [CGRect] {
        var rects: [CGRect] = []
        let rect = getFrameWithInset(rect: bounds)
        if (card?.number == 3) {
            let firstDivision = rect.divided(atDistance: rect.height / 3, from: CGRectEdge.minYEdge)
            let secondDivision = getHalf(rect: firstDivision.remainder)
            rects = [firstDivision.slice, secondDivision.slice, secondDivision.remainder]
            rects = addInsets(rects)
            return rects
        }
        if (card?.number == 1) {
            let firstDivision = rect.divided(atDistance: rect.height / 3, from: CGRectEdge.minYEdge)
            let secondDivision = getHalf(rect: firstDivision.remainder)
            rects = [secondDivision.slice]
            rects = addInsets(rects)
            return rects
        }
        if (card?.number == 2) {
            let firstDivision = rect.divided(atDistance: rect.height / 3, from: CGRectEdge.minYEdge)
            let secondDivision = getHalf(rect: firstDivision.remainder)
            rects = [firstDivision.slice, secondDivision.remainder]
            rects = addInsets(rects)
            return rects
        }
        fatalError("Invalid number!")
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
