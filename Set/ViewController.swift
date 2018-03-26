import UIKit

class ViewController: UIViewController {
    var game: Game = GameImpl(matcher: Positivematcher())
    let renderer: CardRenderer = CardRendererImpl()

    @IBOutlet weak var gameView: GameView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let card = Card(number: 1, shape: Shape.THIRD, color: Color.SECOND, shading: Shading.FIRST)
        gameView.cards.append(card)
        let card1 = Card(number: 2, shape: Shape.FIRST, color: Color.FIRST, shading: Shading.SECOND)
        gameView.cards.append(card1)
        let card2 = Card(number: 3, shape: Shape.SECOND, color: Color.THIRD, shading: Shading.THIRD)
        gameView.cards.append(card2)
//        gameView.addcCard(card: card)
//        gameView.addcCard(card: card)
//        gameView.addcCard(card: card)
//        gameView.addcCard(card: card)
//        gameView.addcCard(card: card)
//        gameView.addcCard(card: card)
//        gameView.addcCard(card: card)
//        gameView.addcCard(card: card)
//        gameView.addcCard(card: card)
//        gameView.addcCard(card: card)

    }
}

