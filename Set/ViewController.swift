import UIKit

class ViewController: UIViewController {
    var game: Game = GameImpl(matcher: Positivematcher())
    let renderer: CardRenderer = CardRendererImpl()

    @IBOutlet weak var gridView: GridView!

    override func viewDidLoad() {
        super.viewDidLoad()
        for index in 0..<30 {
            let label = UILabel()
            label.text = "label \(index)"
            gridView.addSubview(label)
        }
    }
}

