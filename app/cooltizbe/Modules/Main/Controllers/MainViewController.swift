import UIKit

class MainViewController: UIViewController {

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction func searchButtonDidPress(_ sender: UIButton) {
        present(UINavigationController(rootViewController: SearchViewController()), animated: true, completion: nil)
    }
    
}
