import Foundation
import UIKit

class GridView: UIView {
    private lazy var grid: Grid = calculateGrid()

    public var ratio: CGFloat = STANDARD_RATIO {
        didSet {
            setNeedsLayout()
        }
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
            if let frame = grid[index]{
                view.frame = frame
            }
        }
    }

    private func calculateGrid() -> Grid {
        grid = Grid(layout: Grid.Layout.aspectRatio(ratio), frame: bounds)
        grid.cellCount = subviews.count
        return grid
    }
}

extension GridView {

    public static let STANDARD_RATIO: CGFloat = 8 / 5

}
