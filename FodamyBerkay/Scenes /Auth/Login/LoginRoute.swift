//
//  LoginRoute.swift
//  FodamyBerkay
//
//  Created by Mustafa Berkay Kaya on 28.03.2022.
//

protocol LoginRoute {
    func presentLogin()
}

extension LoginRoute where Self: RouterProtocol {
    
    func presentLogin() {
        let router = LoginRouter()
        let viewModel = LoginViewModel(router: router)
        let viewController = LoginViewController(viewModel: viewModel)
        let navigationController = TransparentNavigationController(rootViewController: viewController)
        let transition = ModalTransition(isAnimated: true, modalTransitionStyle: .coverVertical, modalPresentationStyle: .fullScreen)
        
        router.viewController = viewController
        router.openTransition = transition
        
        open(navigationController, transition: transition)
    }
}
