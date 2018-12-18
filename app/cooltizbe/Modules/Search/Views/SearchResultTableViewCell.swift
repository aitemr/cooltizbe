import UIKit

class SearchResultTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var typeLabel: UILabel!
    
    // MARK: - Public
    
    func configureCell(with response: SearchResponse) {
        nameLabel.text = response.name
        typeLabel.text = response.type.rawValue
    }
}
