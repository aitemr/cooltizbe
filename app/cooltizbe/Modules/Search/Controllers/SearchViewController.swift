import UIKit

class SearchViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet private weak var searchTextField: UITextField!
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTextField()
        configureTableView()
    }
    
    // MARK: - UIStatusBarStyle
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    // MARK: Configure TableView
    
    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        let searchResultNib = UINib(nibName: String(describing: SearchResultTableViewCell.self), bundle: nil)
        tableView.register(searchResultNib,
                           forCellReuseIdentifier: String(describing: SearchResultTableViewCell.self))

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
//        searchTextField.inputAccessoryView = ShowScheduleButton(frame: CGRect(x: 0,
//                                                                              y: 0,
//                                                                              width: view.frame.width,
//                                                                              height: 44))
    }
    
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: String(describing: SearchResultTableViewCell.self),
                                             for: indexPath) as! SearchResultTableViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        present(UINavigationController(rootViewController: ScheduleViewController()), animated: true, completion: nil)
    }
}
