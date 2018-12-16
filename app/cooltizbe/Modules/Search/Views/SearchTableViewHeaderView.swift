import UIKit

class SearchTableViewHeaderView: UIView {

    // MARK: - Properties
    
    @IBOutlet private weak var searchTextField: InsetTextField!
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        loadFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        loadFromNib()
    }
}
