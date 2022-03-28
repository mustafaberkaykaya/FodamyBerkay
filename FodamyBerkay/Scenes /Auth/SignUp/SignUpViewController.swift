//
//  SignUpViewController.swift
//  FodamyBerkay
//
//  Created by Mustafa Berkay Kaya on 28.03.2022.
//

import UIKit
import SwiftValidator

final class SignUpViewController: BaseViewController<SignUpViewModel> {
    private let titleLabel = UILabelBuilder()
        .textColor(.appCinder)
        .font(.font(.nunitoBold, size: .xxLarge))
        .build()
    private let topStackView = UIStackViewBuilder()
        .axis(.vertical)
        .spacing(15)
        .build()
    private let usernameTextField = CustomTextField()
    private let emailTextField = CustomTextField()
    private let passwordTextField = CustomTextField()
    private let signUpButton = CustomButton.createPrimaryButton(style: .large)
    private let bottomStackView = UIStackViewBuilder()
        .axis(.horizontal)
        .spacing(4)
        .build()
    private let bottomLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .xLarge))
        .textColor(.appRaven)
        .build()
    private let bottomLoginButton = UIButtonBuilder()
        .titleColor(.appRed)
        .titleFont(.font(.nunitoBold, size: .xLarge))
        .build()
    private let validator = Validator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
        setLocalize()
    }
}

// MARK: - UILayout
extension SignUpViewController {
    private func addSubViews() {
        addTitleLabel()
        addTopStackView()
        addBottomStackView()
    }
    
    private func addTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.topToSuperview(usingSafeArea: true).constant = 50
        titleLabel.centerXToSuperview()
    }
    
    private func addTopStackView() {
        view.addSubview(topStackView)
        topStackView.topToBottom(of: titleLabel).constant = 50
        topStackView.leadingToSuperview().constant = 15
        topStackView.trailingToSuperview().constant = -15
        topStackView.addArrangedSubview(usernameTextField)
        topStackView.addArrangedSubview(emailTextField)
        topStackView.addArrangedSubview(passwordTextField)
        topStackView.addArrangedSubview(signUpButton)
       
    }
    
    private func addBottomStackView() {
        view.addSubview(bottomStackView)
        bottomStackView.addArrangedSubview(bottomLabel)
        bottomStackView.addArrangedSubview(bottomLoginButton)
        bottomStackView.bottomToSuperview(usingSafeArea: true)
        bottomStackView.leadingToSuperview(relation: .equalOrGreater).constant = 20
        bottomStackView.trailingToSuperview(relation: .equalOrLess).constant = -20
        bottomStackView.centerXToSuperview()
    }
}

// MARK: - Configure and Localize
extension SignUpViewController {
    private func configureContents() {
        emailTextField.autocapitalizationType = .none
        emailTextField.keyboardType = .emailAddress
        usernameTextField.leftImage = .icUser
        emailTextField.leftImage = .icMail
        passwordTextField.leftImage = .icPassword
        passwordTextField.isSecureTextEntry = true
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        bottomLoginButton.addTarget(self, action: #selector(bottomLoginButtonTapped), for: .touchUpInside)
        validator.registerField(passwordTextField, rules: [RequiredRule(), PasswordRule()])
        validator.registerField(emailTextField, rules: [EmailRule(), RequiredRule()])
        validator.registerField(usernameTextField, rules: [RequiredRule(), MinLengthRule(length: 6)])
    }
    
    private func setLocalize() {
        titleLabel.text = L10n.SignUp.title
        usernameTextField.title = L10n.SignUp.username
        emailTextField.title = L10n.SignUp.email
        passwordTextField.title = L10n.SignUp.password
        signUpButton.setTitle(L10n.SignUp.button, for: .normal)
        bottomLoginButton.setTitle(L10n.SignUp.loginButton, for: .normal)
        bottomLabel.text = L10n.SignUp.bottomLabel
    }
}

// MARK: - Actions
extension SignUpViewController {
    @objc
    private func bottomLoginButtonTapped() {
        viewModel.goLoginScreen()
    }
    
    @objc
    private func signUpButtonTapped() {
        view.endEditing(true)
        validator.validate(self)
    }
}

// MARK: - ValidatorDelegate
extension SignUpViewController: ValidationDelegate {
    func validationSuccessful() {
        viewModel.signUpRequest(username: usernameTextField.text!, email: emailTextField.text!, password: passwordTextField.text!)
    }
    
    func validationFailed(_ errors: [(Validatable, ValidationError)]) {
        ToastPresenter.showWarningToast(text: (errors[0].1.errorMessage))
    }
}
