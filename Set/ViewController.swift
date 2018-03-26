import UIKit

class ViewController: UIViewController, GridViewCallback {
    var game: Game = GameImpl(matcher: Positivematcher())

    @IBOutlet weak var gameView: GameView!

    override func viewDidLoad() {
        super.viewDidLoad()
        gameView.callBack = self
        updateView()
    }

    private func updateView() {
        gameView.dealtCards = game.dealtCards
        gameView.selectedtCards = game.selectedCards
    }

    func onCardClicked(index: Int) {
        game.selectCard(at: index)
        updateView()
    }
}

