import Foundation
import UIKit

class GameView: UIView {

    private var cards: [Card] = [] {
        didSet {
            redraw()
        }
    }

    private var grid: GridView? {
        get {
            return subviews[0] as? GridView
        }
    }

    func addcCard(card: Card) {
        cards.append(card)
        grid?.addSubview(CardView(card:card))
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {
        let view = GridView(frame: bounds)
        addSubview(view)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        subviews[0].frame = bounds
    }

    private func redraw() {
        if let views = grid?.subviews {
            for view in views {
                view.removeFromSuperview()
            }
        }
        for card in cards {
            grid?.addSubview(CardView(card: card))
        }
    }
}
