import UIKit
import DZNEmptyDataSet

class SearchViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var searcService: SearchService!
    
    var responses: [SearchResponse]? {
        didSet {
            tableView.reloadData()
        }
    }
    
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
        let tableHeaderView = SearchTableViewHeaderView(frame: CGRect(x: 0,
                                                                 y: 0,
                                                                 width: tableView.frame.width,
                                                                 height: 50))
        tableHeaderView.delegate = self
        tableView.tableHeaderView = tableHeaderView
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
    
    private func loadData(with query: String) {
        searcService = SearchService()
        searcService.search(with: query) { [weak self] (responses) in
            guard let responses = responses else {
                return
            }
            
            self?.responses = responses
        }
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return responses?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SearchResultTableViewCell.self),
                                                 for: indexPath) as! SearchResultTableViewCell
        guard let response = responses?[indexPath.row] else {
            return UITableViewCell()
        }
        
        cell.configureCell(with: response)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let response = responses?[indexPath.row] else {
            return
        }
        
        let vc = ScheduleViewController()
        vc.response = response
        
        present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
    }
    
}

// MARK: - DZNEmptyDataSetSource

extension SearchViewController: DZNEmptyDataSetSource {
    
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        return NSAttributedString(string: "🐣", attributes: nil)
    }
    
    func description(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        return NSAttributedString(string: "Enter group, room, teacher name",
                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor.mediumPurple])
    }
}

// MARK: - SearchTableViewHeaderViewDelegate

extension SearchViewController: SearchTableViewHeaderViewDelegate {
    func textFieldValueChanged(on view: SearchTableViewHeaderView, text: String) {
        loadData(with: text)
    }
}
