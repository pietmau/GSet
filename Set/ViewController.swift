import UIKit

class ViewController: UIViewController {
    var game: Game = GameImpl(matcher: Positivematcher())
    let renderer: CardRenderer = CardRendererImpl()

    @IBOutlet weak var gameView: GameView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let card = Card(number: 1, shape: Shape.THIRD, color: Color.SECOND, shading: Shading.FIRST)
        gameView.addcCard(card: card)
        let card1 = Card(number: 2, shape: Shape.THIRD, color: Color.SECOND, shading: Shading.FIRST)
        gameView.addcCard(card: card1)
        let card2 = Card(number: 3, shape: Shape.THIRD, color: Color.SECOND, shading: Shading.FIRST)
        gameView.addcCard(card: card2)
        gameView.addcCard(card: card)
        gameView.addcCard(card: card)
        gameView.addcCard(card: card)
        gameView.addcCard(card: card)
        gameView.addcCard(card: card)
        gameView.addcCard(card: card)
        gameView.addcCard(card: card)
        gameView.addcCard(card: card)
        gameView.addcCard(card: card)
        gameView.addcCard(card: card)

    }
}

