import UIKit
import DZNEmptyDataSet

class SearchViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var searcService: SearchService!
    
    // MARK: - Lifecycle
    
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
    }
    
    // MARK: - Configure TableView
    
    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.backgroundColor = .white
        
        registerTableViewCells()
        configureTableViewHeaderView()
        configureTableViewFooterView()
        configureDZNEmptyDataSet()
        
        loadData()
    }
    
    // MARK: Register TableView Cells
    
    private func registerTableViewCells() {
        let nibName = String(describing: SearchResultTableViewCell.self)
        let searchResultNib = UINib(nibName: nibName, bundle: nil)
        tableView.register(searchResultNib,
                           forCellReuseIdentifier: nibName)
    }
    
    // MARK: Configure TableView Header View
    
    private func configureTableViewHeaderView() {
        tableView.tableHeaderView =
            SearchTableViewHeaderView(frame: CGRect(x: 0,
                                                    y: 0,
                                                    width: tableView.frame.width,
                                                    height: 50))
    }
    
    // MARK: Configure TableView Footer View
    
    private func configureTableViewFooterView() {
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    // MARK: Configure DZNEmptyDataSet
    
    private func configureDZNEmptyDataSet() {
        tableView.emptyDataSetSource = self
    }
    
    // MARK: - Actions
    
    @objc private func closeButtonDidPress() {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Load Data
    
    private func loadData() {
        searcService = SearchService()
        searcService.search(with: "marina") { (items) in
            print(items)
        }
    }
    
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
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

// MARK: - DZNEmptyDataSetSource

extension SearchViewController: DZNEmptyDataSetSource {
    
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        return NSAttributedString(string: "😭", attributes: nil)
    }
    
    func description(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        return NSAttributedString(string: "Sorry, not found. Try again!",
                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor.mediumPurple])
    }
}
