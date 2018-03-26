import UIKit

class ViewController: UIViewController {
    var game: Game = GameImpl(matcher: Positivematcher())
    let renderer: CardRenderer = CardRendererImpl()

    @IBOutlet weak var gameView: GameView!

    override func viewDidLoad() {
        super.viewDidLoad()
        var card = Card(number: 1, shape: Shape.THIRD, color: Color.SECOND, shading: Shading.FIRST)
        gameView.dealtCards.append(card)
        let card1 = Card(number: 2, shape: Shape.FIRST, color: Color.FIRST, shading: Shading.SECOND)
        gameView.dealtCards.append(card1)
        let card2 = Card(number: 3, shape: Shape.SECOND, color: Color.THIRD, shading: Shading.THIRD)
        gameView.dealtCards.append(card2)


        card = Card(number: 1, shape: Shape.THIRD, color: Color.SECOND, shading: Shading.FIRST)
        gameView.dealtCards.append(card)
        card = Card(number: 2, shape: Shape.THIRD, color: Color.SECOND, shading: Shading.FIRST)
        gameView.dealtCards.append(card)
        card = Card(number: 3, shape: Shape.THIRD, color: Color.SECOND, shading: Shading.FIRST)
        gameView.dealtCards.append(card)

        class Callback: GridViewCallback {
            func onCardClicekd(index: Int) {

            }
        }

        gameView.callBack = Callback()
    }
}

