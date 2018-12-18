import UIKit
import DZNEmptyDataSet
import SkeletonView

class ScheduleViewController: UIViewController {

    // MARK: - Properties

    var response: SearchResponse?
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var scheduleService: ScheduleService!

    private var schedule: [Schedule]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationBar()
        configureTableView()
        loadData()
    }
    
    // MARK: - Configure Navigation Bar
    
    private func configureNavigationBar() {
        let searchBarButtonItem = UIBarButtonItem(image: UIImage(named: "schedule_search"),
                                                  style: .plain,
                                                  target: self,
                                                  action: #selector(searchBarButtonItemDidPress))
        
        let settingsBarButtonItem = UIBarButtonItem(image: UIImage(named: "schedule_settings"),
                                                    style: .plain,
                                                    target: self,
                                                    action: #selector(settingsBarButtonItemDidPress))
        
        navigationItem.rightBarButtonItems = [settingsBarButtonItem, searchBarButtonItem]

        guard let title = response?.name else {
            return
        }

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: self, action: nil)
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
    
    // MARK: - Load Data
    
    private func loadData() {
        guard let response = response else {
            return
        }
        
        tableView.showSkeleton()
        
        scheduleService = ScheduleService()
        scheduleService.loadSchedule(with: response) { (schedule) in
            guard let schedule = schedule else {
                return
            }
            
            self.tableView.hideSkeleton()
            print(schedule)
        }
    }
    
    // MARK: - Actions
    
    @objc private func searchBarButtonItemDidPress() {
        present(UINavigationController(rootViewController: SearchViewController()), animated: true, completion: nil)
    }
    
    @objc private func settingsBarButtonItemDidPress() {
        present(UINavigationController(rootViewController: SettingsViewController()), animated: true, completion: nil)
    }
    
}

// MARK: - SkeletonTableViewDataSource, UITableViewDataSource

extension ScheduleViewController: SkeletonTableViewDataSource {
    
    // MARK: SkeletonTableViewDataSource
    
    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView,
                                cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return String(describing: ScheduleTableViewCell.self)
    }
    
    // MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schedule?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ScheduleTableViewCell.self),
                                                 for: indexPath) as! ScheduleTableViewCell
        
        guard let schedule = schedule?[indexPath.row] else {
            return UITableViewCell()
        }
        
        cell.configureCell(with: schedule)
    
        return cell
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
