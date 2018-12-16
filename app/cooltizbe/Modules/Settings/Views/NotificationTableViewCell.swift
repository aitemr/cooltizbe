import UIKit

class NotificationTableViewCell: UITableViewCell {

    // MARK: - Properties
    
    @IBOutlet private weak var cellImageView: UIImageView!
    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var switcher: UISwitch!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
