//
//  MainTabBarRoute.swift
//  FodamyBerkay
//
//  Created by Mustafa Berkay Kaya on 13.03.2022.
//

protocol MainTabBarRoute {
    func placeOnWindowMainTabBar()
}

extension MainTabBarRoute where Self: RouterProtocol {
    
    func placeOnWindowMainTabBar() {
        let mainTabBarController = MainTabBarController()
        let transition = PlaceOnWindowTransition()

        open(mainTabBarController, transition: transition)
    }
}
