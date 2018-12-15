import UIKit

class ShowScheduleButton: UIView {
    
    // MARK: Properties

    @IBOutlet private var view: UIView!
    
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
        let className = String(describing: ShowScheduleButton.self)
        bundle.loadNibNamed(className, owner: self, options: nil)
        
        view.frame = bounds
        addSubview(view)
    }
    
    // MARK: - Actions
    
    @IBAction func showScheduleButtonDidPress(_ sender: UIButton) {
    }
    
}
