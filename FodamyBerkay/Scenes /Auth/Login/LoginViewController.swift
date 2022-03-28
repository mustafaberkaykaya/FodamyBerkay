//
//  LoginViewController.swift
//  FodamyBerkay
//
//  Created by Mustafa Berkay Kaya on 28.03.2022.
//

import UIKit
import SwiftValidator

final class LoginViewController: BaseViewController<LoginViewModel> {
    private let titleLabel = UILabelBuilder()
            .textColor(.appCinder)
            .font(.font(.nunitoBold, size: .xxLarge))
            .build()
    private let topStackView = UIStackViewBuilder()
            .axis(.vertical)
            .spacing(15)
            .build()
    private let usernameTextField = CustomTextField()
    private let passwordTextField = CustomTextField()
    private let loginButton = CustomButton.createPrimaryButton(style: .large)
    private let forgotPasswordButton = UIButtonBuilder()
        .titleFont(.font(.nunitoSemiBold, size: .large))
        .titleColor(.appRaven)
        .build()
    private let bottomStackView = UIStackViewBuilder()
            .axis(.horizontal)
            .spacing(4)
            .build()
    private let bottomLabel = UILabelBuilder()
            .font(.font(.nunitoBold, size: .xLarge))
            .textColor(.appRaven)
            .build()
    private let registerButton = UIButtonBuilder()
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
extension LoginViewController {
    private func addSubViews() {
        addTitleLabel()
        addTopStackView()
        addForgotPasswordButton()
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
        topStackView.addArrangedSubview(passwordTextField)
        topStackView.addArrangedSubview(loginButton)
    }
    
    private func addForgotPasswordButton() {
        view.addSubview(forgotPasswordButton)
        forgotPasswordButton.topToBottom(of: topStackView).constant = 10
        forgotPasswordButton.trailingToSuperview().constant = -15
        forgotPasswordButton.height(20)
        forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside)
    }
    
    private func addBottomStackView() {
        view.addSubview(bottomStackView)
        bottomStackView.leadingToSuperview(relation: .equalOrGreater).constant = 20
        bottomStackView.trailingToSuperview(relation: .equalOrLess).constant = -20
        bottomStackView.bottomToSuperview(usingSafeArea: true)
        bottomStackView.centerXToSuperview()
        bottomStackView.addArrangedSubview(bottomLabel)
        bottomStackView.addArrangedSubview(registerButton)
    }
}

// MARK: - Configure and Localize
extension LoginViewController {
    private func configureContents() {
        usernameTextField.autocapitalizationType = .none
        usernameTextField.leftImage = .icUser
        passwordTextField.leftImage = .icPassword
        passwordTextField.isSecureTextEntry = true
        configureCrossIconButton()
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        validator.registerField(passwordTextField, rules: [RequiredRule(), PasswordRule()])
        validator.registerField(usernameTextField, rules: [RequiredRule(), MinLengthRule(length: 6)])
    }
    
    private func setLocalize() {
        titleLabel.text = L10n.Login.title
        usernameTextField.title = L10n.Login.username
        passwordTextField.title = L10n.Login.password
        loginButton.setTitle(L10n.Login.button, for: .normal)
        forgotPasswordButton.setTitle(L10n.Login.forgot,
                                      for: .normal)
        registerButton.setTitle(L10n.Login.register, for: .normal)
        bottomLabel.text = L10n.Login.bottomLabel
    }

    private func configureCrossIconButton() {
        let image = UIImage.icClose.withRenderingMode(.alwaysTemplate)
        let cancelBarButton = UIBarButtonItem(image: image, style: .done, target: self, action: #selector(tappedCrossIcon))
        cancelBarButton.tintColor = UIColor.black
        navigationItem.rightBarButtonItem = cancelBarButton
    }
}

// MARK: - Actions
extension LoginViewController {
    @objc
    private func loginButtonTapped() {
        view.endEditing(true)
        validator.validate(self)
    
    }
    
    @objc
    private func forgotPasswordButtonTapped() {
        viewModel.goPasswordForgotScreen()
    }
    
    @objc
    private func registerButtonTapped() {
        viewModel.goRegisterSceen()
    }
    
    @objc
    private func tappedCrossIcon() {
        viewModel.closeScreen()
    }
}

// MARK: - ValidatorDelegate
extension LoginViewController: ValidationDelegate {
    func validationSuccessful() {
        viewModel.loginRequest(username: usernameTextField.text!, password: passwordTextField.text!)
    }
    
    func validationFailed(_ errors: [(Validatable, ValidationError)]) {
        ToastPresenter.showWarningToast(text: (errors[0].1.errorMessage))
    }
}
