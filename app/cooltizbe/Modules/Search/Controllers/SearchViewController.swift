import UIKit

class SearchViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - LifeCycle
    
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
        navigationController?.navigationBar.barTintColor = .mediumPurple
    }
    
    // MARK: - Configure TableView
    
    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        let searchResultNib = UINib(nibName: String(describing: SearchResultTableViewCell.self), bundle: nil)
        tableView.register(searchResultNib,
                           forCellReuseIdentifier: String(describing: SearchResultTableViewCell.self))

        configureTableViewHeaderView()
    }
    
    private func configureTableViewHeaderView() {
        tableView.tableHeaderView =
            SearchTableViewHeaderView(frame: CGRect(x: 0,
                                                    y: 0,
                                                    width: tableView.frame.width,
                                                    height: 50))
    }
    
    // MARK: - Actions
    
    @objc private func closeButtonDidPress() {
        dismiss(animated: true, completion: nil)
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
