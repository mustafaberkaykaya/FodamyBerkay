//
//  MainTabBarController.swift
//  FodamyBerkay
//
//  Created by Mustafa Berkay Kaya on 13.03.2022.
//

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = .appRed
        let homeViewController = createHomeViewController()
        viewControllers = [homeViewController]
    }

    private func createHomeViewController() -> UINavigationController {
        let homeRouter = HomeRouter()
        let homeViewModel = HomeViewModel(router: homeRouter)
        let homeViewController = HomeViewController(viewModel: homeViewModel)
        let navigationController = MainNavigationController(rootViewController: homeViewController)
        homeRouter.viewController = homeViewController
        return navigationController
    }
}
