import UIKit.UINavigationController

extension UINavigationBar {
    
    func setGradientBackground(colors: [UIColor]) {
        var updatedFrame = bounds
        updatedFrame.size.height += self.frame.origin.y
        
        let gradientLayer = CAGradientLayer(frame: updatedFrame, colors: colors)
        
        setBackgroundImage(gradientLayer.getGradientImage(), for: UIBarMetrics.default)
    }
}
