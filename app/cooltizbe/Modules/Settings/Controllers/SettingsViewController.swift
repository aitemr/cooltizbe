import UIKit

class SettingsViewController: UIViewController {

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
        title = "Settings"

        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "cross"),
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(closeButtonDidPress))

        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = .gradientSecondaryColor
    }
    
    // MARK: - Configure Table View
    
    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.separatorStyle = .none
        
        registerTableViewCells()
    }
    
    // MARK: - Register TableView Cells
    
    private func registerTableViewCells() {
        let notificationNib = UINib(nibName: String(describing: NotificationTableViewCell.self), bundle: nil)
        let disclosureNib = UINib(nibName: String(describing: DisclosureSettingsTableViewCell.self), bundle: nil)
        let settingsNib = UINib(nibName: String(describing: SettingsTableViewCell.self), bundle: nil)

        tableView.register(notificationNib,
                           forCellReuseIdentifier: String(describing: NotificationTableViewCell.self))
        tableView.register(disclosureNib,
                           forCellReuseIdentifier: String(describing: DisclosureSettingsTableViewCell.self))
        tableView.register(settingsNib,
                           forCellReuseIdentifier: String(describing: SettingsTableViewCell.self))
    }

    // MARK: - Actions
    
    @objc private func closeButtonDidPress() {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
           return tableView.dequeueReusableCell(withIdentifier: String(describing: NotificationTableViewCell.self),
                                          for: indexPath) as! NotificationTableViewCell
        case 1:
            return tableView.dequeueReusableCell(withIdentifier:
                String(describing: DisclosureSettingsTableViewCell.self),
                                                 for: indexPath) as! DisclosureSettingsTableViewCell
        case 2:
            return tableView.dequeueReusableCell(withIdentifier: String(describing: SettingsTableViewCell.self),
                                                 for: indexPath) as! SettingsTableViewCell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
