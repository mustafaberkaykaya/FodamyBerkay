//
//  AppRouter.swift
//  FodamyBerkay
//
//  Created by Mustafa Berkay Kaya on 7.03.2022.
//

import UIKit

final class AppRouter: Router, AppRouter.Routes {
    
    typealias Routes = WalkthroughRoute & HomeRoute
    
    static let shared = AppRouter()
    
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
            AppRouter.shared.pushHome()
        } else {
            AppRouter.shared.placeOnWindowWalkThrough()
        }
    }
}
