//
//  LoginViewModel.swift
//  FodamyBerkay
//
//  Created by Mustafa Berkay Kaya on 28.03.2022.
//

import Foundation
import KeychainSwift

protocol LoginViewDataSource {}

protocol LoginViewEventSource {}

protocol LoginViewProtocol: LoginViewDataSource, LoginViewEventSource {
    func goRegisterSceen()
    func goPasswordForgotScreen()
    func closeScreen()
    func loginRequest(username: String, password: String)
}

final class LoginViewModel: BaseViewModel<LoginRouter>, LoginViewProtocol {
    let keychain = KeychainSwift()
    
    func goRegisterSceen() {
        router.pushSignUp()
    }
    
    func goPasswordForgotScreen() {
        router.pushForgotPassword()
    }
    
    func closeScreen() {
        router.close()
    }
    
    func loginRequest(username: String, password: String) {
        showLoading?()
        dataProvider.request(for: LoginRequest(username: username, password: password)) { [weak self] result in
            guard let self = self else { return }
            self.hideLoading?()
            switch result {
            case .success(let response):
                self.keychain.set(response.token, forKey: Keychain.token)
                DefaultsKey.userId.value = response.user.id
                self.router.close()
            case .failure(let error):
                self.showWarningToast?(error.localizedDescription.description)
            }
        }
    }
}
