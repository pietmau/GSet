//
// Created by Maurizio Pietrantuono on 23/03/2018.
// Copyright (c) 2018 Maurizio Pietrantuono. All rights reserved.
//

import Foundation
import UIKit

class CardView: UIView {
    var card:Card? = nil
    
    init(card: Card) {
        super.init(frame: CGRect.zero)
        self.card = card
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        var inset = rect.insetBy(dx: CGFloat(10), dy: CGFloat(10))
        let foo = UIBezierPath(roundedRect: inset, cornerRadius: CGFloat(10))
        UIColor.blue.setFill()
        foo.fill()
    }
}
