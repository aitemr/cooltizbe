import UIKit

class SearchViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet private weak var searchTextField: UITextField!
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
        configureTableView()
    }
    
    // MARK: - Configure Navigation Bar
    
    private func configureNavigationBar() {
        title = "Search"

        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "cross"),
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(closeButtonDidPress))

        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = .gradientSecondaryColor
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
    
    @objc private func closeButtonDidPress() {
        dismiss(animated: true, completion: nil)
    }
    
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: String(describing: SearchResultTableViewCell.self),
                                             for: indexPath) as! SearchResultTableViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        present(UINavigationController(rootViewController: ScheduleViewController()), animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "1 course"
    }
    
}
