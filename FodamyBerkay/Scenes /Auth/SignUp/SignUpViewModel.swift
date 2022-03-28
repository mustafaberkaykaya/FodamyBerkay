//
//  SignUpViewModel.swift
//  FodamyBerkay
//
//  Created by Mustafa Berkay Kaya on 28.03.2022.
//

import Foundation

protocol SignUpViewDataSource {}

protocol SignUpViewEventSource {}

protocol SignUpViewProtocol: SignUpViewDataSource, SignUpViewEventSource {
    func goLoginScreen()
    func signUpRequest(username: String, email: String, password: String)
}

final class SignUpViewModel: BaseViewModel<SignUpRouter>, SignUpViewProtocol {
    func goLoginScreen() {
        router.presentLogin()
    }
    
    func signUpRequest(username: String, email: String, password: String) {
        showLoading?()
        dataProvider.request(for: SignUpRequest(username: username, email: email, password: password)) { [weak self] (result) in
            guard let self = self else { return }
            self.hideLoading?()
            switch result {
            case .success(let response):
                print(response.token)
                self.router.close()
            case .failure(let error):
                self.showWarningToast?(error.localizedDescription)
            }
        }
    }
}
