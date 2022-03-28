//
//  ForgotPasswordViewController.swift
//  FodamyBerkay
//
//  Created by Mustafa Berkay Kaya on 28.03.2022.
//

import UIKit
import SwiftValidator

final class ForgotPasswordViewController: BaseViewController<ForgotPasswordViewModel> {
    private let titleLabel = UILabelBuilder()
        .textColor(.appCinder)
        .font(.font(.nunitoBold, size: .xxLarge))
        .build()
    private let stackView = UIStackViewBuilder()
        .axis(.vertical)
        .spacing(15)
        .build()
    private var emailTextField = CustomTextField()
    private var forgotPasswordButton = CustomButton.createPrimaryButton(style: .large)
    private let validator = Validator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
        setLocalize()
    }
}

// MARK: - UILayout
extension ForgotPasswordViewController {
    private func addSubViews() {
        view.addSubview(titleLabel)
        addStackView()
    }
    
    private func addStackView() {
        view.addSubview(stackView)
        titleLabel.topToSuperview(usingSafeArea: true).constant = 50
        titleLabel.centerXToSuperview()
        stackView.topToBottom(of: titleLabel).constant = 50
        stackView.leadingToSuperview().constant = 15
        stackView.trailingToSuperview().constant = -15
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(forgotPasswordButton)
    }
}

// MARK: - Configure and Localize
extension ForgotPasswordViewController {
    private func configureContents() {
        emailTextField.leftImage = .icMail
        emailTextField.autocapitalizationType = .none
        emailTextField.keyboardType = .emailAddress
        forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside)
        validator.registerField(emailTextField, rules: [EmailRule(), RequiredRule()])
    }
    
    private func setLocalize() {
        titleLabel.text = L10n.ForgotPassword.title
        emailTextField.title = L10n.ForgotPassword.email
        forgotPasswordButton.setTitle(L10n.ForgotPassword.button, for: .normal)
    }
}

// MARK: - Actions
extension ForgotPasswordViewController {
    @objc
    private func forgotPasswordButtonTapped() {
        view.endEditing(true)
        validator.validate(self)
    }
}

// MARK: - ValidatorDelegate
extension ForgotPasswordViewController: ValidationDelegate {
    func validationSuccessful() {
        viewModel.forgotPasswordRequest(email: emailTextField.text!)
    }
    
    func validationFailed(_ errors: [(Validatable, ValidationError)]) {
        ToastPresenter.showWarningToast(text: (errors[0].1.errorMessage))
    }
}
