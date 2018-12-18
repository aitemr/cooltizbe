import UIKit

class DisclosureSettingsTableViewCell: UITableViewCell {

    // MARK: - Properties
    
    @IBOutlet private weak var cellImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subTitleLabel: UILabel!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Private
    
    private func configureCell() { }
    
}
