import Foundation
import UIKit

class GridView: UIView {
    private var grid: Grid? = nil

    public var ratio: CGFloat = STANDARD_RATIO {
        didSet {
            setNeedsLayout()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func addSubview(_ view: UIView) {
        super.addSubview(view)
        layoutSubviews()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        calculateGrid()
        layoutViews()
    }

    private func layoutViews() {
        for index in 0..<subviews.count {
            var view: UIView = subviews[index]
            if let frame = grid?[index] {
                view.frame = frame
            }
        }
    }

    private func calculateGrid() {
        grid = Grid(layout: Grid.Layout.aspectRatio(ratio), frame: bounds)
        grid?.cellCount = subviews.count
    }
}

extension GridView {

    public static let STANDARD_RATIO: CGFloat = 5 / 8

}
