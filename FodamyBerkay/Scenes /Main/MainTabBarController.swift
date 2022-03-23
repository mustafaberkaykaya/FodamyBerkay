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
        let favoritesViewController = createFavoritesViewController()
        viewControllers = [homeViewController, favoritesViewController]
    }

    private func createHomeViewController() -> UINavigationController {
        let homeRouter = HomeRouter()
        let homeViewModel = HomeViewModel(router: homeRouter)
        let homeViewController = HomeViewController(viewModel: homeViewModel)
        let navigationController = MainNavigationController(rootViewController: homeViewController)
        homeRouter.viewController = homeViewController
        return navigationController
    }
    
    private func createFavoritesViewController() -> UINavigationController {
        let favoritesRouter = FavoritesRouter()
        let favoritesViewModel = FavoritesViewModel(router: favoritesRouter)
        let favoritesViewController = FavoritesViewController(viewModel: favoritesViewModel)
        let navController = MainNavigationController(rootViewController: favoritesViewController)
        navController.tabBarItem.image = .icHeart
        favoritesRouter.viewController = favoritesViewController
        return navController
    }
}
