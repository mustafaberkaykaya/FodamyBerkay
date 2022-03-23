//
//  LoadingProtocol.swift
//  UIComponents
//
//  Created by Mustafa Berkay Kaya on 16.03.2022.
//

public protocol LoadingProtocol {
    func presentLoading()
    func dismissLoading()
}

public extension LoadingProtocol where Self: UIViewController {
    func presentLoading() {
        let window = UIApplication.shared.windows.first
        window?.startBlockingActivityIndicator()
    }

    func dismissLoading() {
        let window = UIApplication.shared.windows.first
        window?.stopBlockingActivityIndicator()
    }
}
