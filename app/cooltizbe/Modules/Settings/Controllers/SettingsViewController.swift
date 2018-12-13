import UIKit

class SettingsViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerTableViewCells()
    }
    
    // MARK: - Register TableView Cells
    
    private func registerTableViewCells() {
        tableView.dataSource = self
        
        let notificationNib = UINib(nibName: String(describing: NotificationTableViewCell.self), bundle: nil)
        tableView.register(notificationNib,
                           forCellReuseIdentifier: String(describing: NotificationTableViewCell.self))
    }
}

extension SettingsViewController: UITableViewDataSource {
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: String(describing: NotificationTableViewCell.self),
                                                 for: indexPath) as! NotificationTableViewCell
    }
}
