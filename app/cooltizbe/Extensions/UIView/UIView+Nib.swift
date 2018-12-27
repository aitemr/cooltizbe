import UIKit.UIView

extension UIView {
    
    func loadFromNib() {
        let className = String(describing: type(of: self))
        guard let view = Bundle.main.loadNibNamed(className, owner: self, options: nil)?.first as? UIView else {
            fatalError("Xib-file doesn't exist for UIView object: \(self)")
        }
        
        view.frame = bounds
        addSubview(view)
    }
}
