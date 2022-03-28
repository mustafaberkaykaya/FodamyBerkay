//
//  SignUpRoute.swift
//  FodamyBerkay
//
//  Created by Mustafa Berkay Kaya on 28.03.2022.
//

protocol SignUpRoute {
    func pushSignUp()
}

extension SignUpRoute where Self: RouterProtocol {
    
    func pushSignUp() {
        let router = SignUpRouter()
        let viewModel = SignUpViewModel(router: router)
        let viewController = SignUpViewController(viewModel: viewModel)
        
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
