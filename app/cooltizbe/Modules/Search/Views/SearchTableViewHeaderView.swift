import UIKit

class SearchTableViewHeaderView: UIView {

    // MARK: - Properties
    
    @IBOutlet private var view: UIView!
    @IBOutlet private weak var searchTextField: InsetTextField!
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        configureViews()
    }
    
    // MARK: Configure Views
    
    private func configureViews() {
        let bundle = Bundle(for: classForCoder)
        let className = String(describing: SearchTableViewHeaderView.self)
        bundle.loadNibNamed(className, owner: self, options: nil)
        
        view.frame = bounds
        addSubview(view)
    }
    
}
