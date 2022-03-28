//
//  ForgotPasswordViewModel.swift
//  FodamyBerkay
//
//  Created by Mustafa Berkay Kaya on 28.03.2022.
//

import Foundation

protocol ForgotPasswordViewDataSource {}

protocol ForgotPasswordViewEventSource {}

protocol ForgotPasswordViewProtocol: ForgotPasswordViewDataSource, ForgotPasswordViewEventSource {
    func forgotPasswordRequest(email: String)
}

final class ForgotPasswordViewModel: BaseViewModel<ForgotPasswordRouter>, ForgotPasswordViewProtocol {
    func forgotPasswordRequest(email: String) {
        showLoading?()
        let request = ForgotPasswordRequest(email: email)
        dataProvider.request(for: request) { [weak self] (result) in
            guard let self = self else { return }
            self.hideLoading?()
            switch result {
            case .success:
                self.router.close()
            case .failure(let error):
                self.showWarningToast?(error.localizedDescription)
            }
        }
    }
}
