import UIKit

class SearchResultTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var typeLabel: UILabel!
    
    // MARK: - Public
    
    func configureCell(with model: Search) {
        nameLabel.text = model.nameEn
        typeLabel.text = model.type
    }
}
