import UIKit

class SettingsViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
        registerTableViewCells()
    }
    
    // MARK: - UIStatusBarStyle
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Configure Navigation Bar
    
    private func configureNavigationBar() {
        title = "Settings"
        navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.setGradientBackground(colors: [.gradientPrimaryColor,
                                                                           .gradientSecondaryColor])
    }
    
    // MARK: - Register TableView Cells
    
    private func registerTableViewCells() {
        tableView.dataSource = self
        tableView.delegate = self
        
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
