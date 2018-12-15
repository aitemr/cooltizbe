import UIKit

class SearchViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet private weak var searchTextField: UITextField!
    
    // MARK: View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTextField()
        setNeedsStatusBarAppearanceUpdate()
    }
    
    // MARK: - UIStatusBarStyle
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    } 

    // MARK: - Actions
    
    @IBAction func closeButtonDidPress(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Configure TextField
    
    private func configureTextField() {
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = #colorLiteral(red: 0.8431372549, green: 0.8431372549, blue: 0.8431372549, alpha: 1)
        border.frame = CGRect(x: 0,
                              y: searchTextField.frame.size.height - width,
                              width: searchTextField.frame.size.width,
                              height: searchTextField.frame.size.height)
        
        border.borderWidth = width
        searchTextField.layer.addSublayer(border)
        searchTextField.layer.sublayerTransform = CATransform3DMakeTranslation(16, 0, 0)
        searchTextField.layer.masksToBounds = true
        
        addInputAccessoryView()
    }
    
    private func addInputAccessoryView() {
        searchTextField.inputAccessoryView = ShowScheduleButton(frame: CGRect(x: 0,
                                                                              y: 0,
                                                                              width: view.frame.width,
                                                                              height: 44))
    }
    
}
