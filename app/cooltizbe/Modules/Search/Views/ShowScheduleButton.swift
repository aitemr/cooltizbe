import UIKit

class ShowScheduleButton: UIView {
    
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
    
    @IBAction func showScheduleButtonDidPress(_ sender: UIButton) {
    }
    
}
