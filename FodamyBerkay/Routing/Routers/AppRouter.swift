//
//  AppRouter.swift
//  FodamyBerkay
//
//  Created by Mustafa Berkay Kaya on 7.03.2022.
//

import UIKit
import SKPhotoBrowser

final class AppRouter: Router, AppRouter.Routes {
    
    typealias Routes = WalkthroughRoute & MainTabBarRoute & SKPhotoBrowserRoute
    
    static let shared = AppRouter()
    
    func presentSKPhotoBrowser(with photos: [String], delegate: PhotoBrowserDelegate, initialPageIndex: Int = 0) {
        guard let topVC = topViewController() else { return }
        presentSKPhotoBrowser(with: photos, viewController: topVC, initialPageIndex: initialPageIndex, delegate: delegate)
    }
    
    private func topViewController() -> UIViewController? {
        let keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow })
        if var topController = keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController
        }
        return nil
    }
    
    func startApp() {
        if DefaultsKey.isWalkThroughCompleted.value == true {
            AppRouter.shared.placeOnWindowMainTabBar()
        } else {
            AppRouter.shared.placeOnWindowWalkThrough()
        }
    }
}
