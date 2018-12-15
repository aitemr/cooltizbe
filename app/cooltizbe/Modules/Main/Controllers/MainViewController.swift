import UIKit

class MainViewController: UIViewController {

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - UIStatusBarStyle
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Actions
    
    @IBAction func searchButtonDidPress(_ sender: UIButton) {
        present(SearchViewController(), animated: true, completion: nil)
    }
    
}
