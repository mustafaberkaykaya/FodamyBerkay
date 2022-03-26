//
//  LoginReminderRoute.swift
//  FodamyBerkay
//
//  Created by Mustafa Berkay Kaya on 26.03.2022.
//

protocol LoginReminderRoute {
    func pushLoginReminder(loginHandler: @escaping VoidClosure)
}

extension LoginReminderRoute where Self: RouterProtocol {
    
    func pushLoginReminder(loginHandler: @escaping VoidClosure) {
        let router = LoginReminderRouter()
        let viewModel = LoginReminderViewModel(router: router)
        let viewController = LoginReminderViewController(viewModel: viewModel)
        viewModel.loginHandler = loginHandler
        
        let transition = ModalTransition()
        transition.modalPresentationStyle = .overFullScreen
        transition.modalTransitionStyle = .crossDissolve
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
