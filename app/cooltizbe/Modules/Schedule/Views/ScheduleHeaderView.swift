import UIKit

class ScheduleHeaderView: UIView {

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
