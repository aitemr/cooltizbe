import UIKit

protocol SearchTableViewHeaderViewDelegate: class {
    func textFieldValueChanged(on view: SearchTableViewHeaderView, text: String)
}

class SearchTableViewHeaderView: UIView {

    // MARK: - Properties
    
    @IBOutlet private weak var searchTextField: InsetTextField!
    
    weak var delegate: SearchTableViewHeaderViewDelegate?
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        loadFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        loadFromNib()
    }

    // MARK: - Actions

    @IBAction func textFieldValueChanged(_ sender: InsetTextField) {
        guard let text = sender.text else {
            return
        }
        
        delegate?.textFieldValueChanged(on: self, text: text)
    }
}
