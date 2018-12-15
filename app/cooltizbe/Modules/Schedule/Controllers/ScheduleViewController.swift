import UIKit

class ScheduleViewController: UIViewController {

    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationBar()
    }
    
    // MARK: - UIStatusBarStyle
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: Configure Navigation Bar
    
    private func configureNavigationBar() {

        navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.red]
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "CSSE-145K", style: .plain, target: self, action: nil)
        
//        navigationController?.navigationBar.setGradientBackground(colors: [.gradientPrimaryColor,
//                                                                           .gradientSecondaryColor])
        let searchBarButtonItem = UIBarButtonItem(image: UIImage(named: "schedule_search"),
                                                  style: .plain,
                                                  target: self,
                                                  action: #selector(searchBarButtonItemDidPress))
        
        let settingsBarButtonItem = UIBarButtonItem(image: UIImage(named: "schedule_settings"),
                                                    style: .plain,
                                                    target: self,
                                                    action: #selector(settingsBarButtonItemDidPress))
        
        navigationItem.rightBarButtonItems = [settingsBarButtonItem, searchBarButtonItem]
        
        navigationController?.navigationBar.barTintColor = .white
    }

    // MARK: Actions
    
    @objc private func searchBarButtonItemDidPress() {
        present(SearchViewController(), animated: true, completion: nil)
    }
    
    @objc private func settingsBarButtonItemDidPress() {
        present(SettingsViewController(), animated: true, completion: nil)
    }
    
}
