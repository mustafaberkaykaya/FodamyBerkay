//
//  LoginReminderViewModel.swift
//  FodamyBerkay
//
//  Created by Mustafa Berkay Kaya on 26.03.2022.
//

import Foundation

protocol LoginReminderViewDataSource {}

protocol LoginReminderViewEventSource {
    var loginHandler: VoidClosure? { get set }
}

protocol LoginReminderViewProtocol: LoginReminderViewDataSource, LoginReminderViewEventSource {
    func cancelButtonAction()
    func loginButtonAction()
}

final class LoginReminderViewModel: BaseViewModel<LoginReminderRouter>, LoginReminderViewProtocol {
    var loginHandler: VoidClosure?
    
    func cancelButtonAction() {
        router.close()
    }
    
    func loginButtonAction() {
        router.close()
        loginHandler?()
    }
}
