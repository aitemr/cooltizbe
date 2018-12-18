import UIKit
import DZNEmptyDataSet

class ScheduleViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationBar()
        configureTableView()
    }
    
    // MARK: - Configure Navigation Bar
    
    private func configureNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "CSSE-145K", style: .plain, target: self, action: nil)
        
        let searchBarButtonItem = UIBarButtonItem(image: UIImage(named: "schedule_search"),
                                                  style: .plain,
                                                  target: self,
                                                  action: #selector(searchBarButtonItemDidPress))
        
        let settingsBarButtonItem = UIBarButtonItem(image: UIImage(named: "schedule_settings"),
                                                    style: .plain,
                                                    target: self,
                                                    action: #selector(settingsBarButtonItemDidPress))
        
        navigationItem.rightBarButtonItems = [settingsBarButtonItem, searchBarButtonItem]
    }

    // MARK: - Configure TableView
    
    private func configureTableView() {
        tableView.dataSource = self
        
        tableView.allowsSelection = false
        
        registerTableViewCells()
        configureTableViewHeaderView()
        configureTableViewFooterView()
        configureDZNEmptyDataSet()
    }
    
    // MARK: Register TableView Cells
    
    private func registerTableViewCells() {
        let scheduleCell = UINib(nibName: String(describing: ScheduleTableViewCell.self), bundle: nil)
        tableView.register(scheduleCell,
                           forCellReuseIdentifier: String(describing: ScheduleTableViewCell.self))
    }
    
    // MARK: Configure TableView Header View
    
    private func configureTableViewHeaderView() {
        let tableViewHeaderView = ScheduleHeaderView(frame: CGRect(x: 0,
                                                                   y: 0,
                                                                   width: tableView.frame.width,
                                                                   height: 120))
        tableView.tableHeaderView = tableViewHeaderView
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
    
    @objc private func searchBarButtonItemDidPress() {
        present(UINavigationController(rootViewController: SearchViewController()), animated: true, completion: nil)
    }
    
    @objc private func settingsBarButtonItemDidPress() {
        present(UINavigationController(rootViewController: SettingsViewController()), animated: true, completion: nil)
    }
    
}

// MARK: - UITableViewDataSource

extension ScheduleViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: String(describing: ScheduleTableViewCell.self),
                                             for: indexPath) as! ScheduleTableViewCell
    }
    
}

// MARK: - DZNEmptyDataSetSource

extension ScheduleViewController: DZNEmptyDataSetSource {
    
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        tableView.backgroundColor = .white
        return NSAttributedString(string: "🎉", attributes: nil)
    }
    
    func description(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        return NSAttributedString(string: "You don't have any classes!",
                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor.mediumPurple])
    }
}
