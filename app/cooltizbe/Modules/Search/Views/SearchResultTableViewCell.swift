import UIKit

class SearchResultTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    @IBOutlet private weak var groupNameLabel: UILabel!
    @IBOutlet private weak var groupFullNameLabel: UILabel!
    
    // MARK: - Public
    
    func configureCell(with model: Search) {
        groupNameLabel.text = model.nameEn
        groupFullNameLabel.text = "Computer Science"
    }
}
