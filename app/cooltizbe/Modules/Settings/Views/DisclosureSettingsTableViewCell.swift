import UIKit

class DisclosureSettingsTableViewCell: UITableViewCell {

    // MARK: - Properties
    
    @IBOutlet private weak var cellImageView: UIImageView!
    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var subTitle: UILabel!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Private
    
    private func configureCell() { }
    
}
