import UIKit

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
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = .mediumPurple
    }

    // MARK: - Configure TableView
    
    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        registerTableViewCells()
        configureTableViewHeaderView()
    }
    
    // MARK: Register Table View Cells
    
    private func registerTableViewCells() {
        let scheduleCell = UINib(nibName: String(describing: ScheduleTableViewCell.self), bundle: nil)
        tableView.register(scheduleCell,
                           forCellReuseIdentifier: String(describing: ScheduleTableViewCell.self))
    }
    
    // MARK: Configure Table View Header View
    
    private func configureTableViewHeaderView() { }
    
    // MARK: - Actions
    
    @objc private func searchBarButtonItemDidPress() {
        present(UINavigationController(rootViewController: SearchViewController()), animated: true, completion: nil)
    }
    
    @objc private func settingsBarButtonItemDidPress() {
        present(UINavigationController(rootViewController: SettingsViewController()), animated: true, completion: nil)
    }
    
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension ScheduleViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: String(describing: ScheduleTableViewCell.self),
                                             for: indexPath) as! ScheduleTableViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
