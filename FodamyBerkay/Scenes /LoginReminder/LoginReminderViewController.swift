//
//  LoginReminderViewController.swift
//  FodamyBerkay
//
//  Created by Mustafa Berkay Kaya on 26.03.2022.
//

import UIKit

final class LoginReminderViewController: BaseViewController<LoginReminderViewModel> {
    private let mainContentView = UIViewBuilder()
        .backgroundColor(.appWhite)
        .cornerRadius(4)
        .masksToBounds(true)
        .clipsToBounds(true)
        .build()
    private let warningLabel = UILabelBuilder()
        .text(L10n.LoginPopUp.warning)
        .textAlignment(.center)
        .textColor(.appCinder)
        .font(.font(.nunitoSemiBold, size: .large))
        .build()
    private let imageView = UIImageViewBuilder()
        .image(.icWarning.withRenderingMode(.alwaysTemplate))
        .tintColor(.yellow)
        .contentMode(.scaleAspectFit)
        .masksToBounds(true)
        .clipsToBounds(true)
        .build()
    private let buttonsStackView = UIStackViewBuilder()
        .axis(.horizontal)
        .alignment(.fill)
        .distribution(.fillEqually)
        .build()
    private let loginButton = UIButtonBuilder()
        .backgroundColor(.appRed)
        .title(L10n.LoginPopUp.login)
        .titleColor(.appWhite)
        .titleFont(.font(.nunitoBold, size: .medium))
        .build()
    private let cancelButton = UIButtonBuilder()
        .backgroundColor(.appZircon)
        .title(L10n.LoginPopUp.cancel)
        .titleColor(.appCinder)
        .titleFont(.font(.nunitoBold, size: .medium))
        .build()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
    }
}

// MARK: - UILayout
extension LoginReminderViewController {
    private func addSubViews() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.40)
        addMainContentView()
        addImageView()
        addWarningLabel()
        addButtons()
    }
    
    private func addMainContentView() {
        view.addSubview(mainContentView)
        mainContentView.centerYToSuperview()
        mainContentView.leadingToSuperview().constant = 25
        mainContentView.trailingToSuperview().constant = -25
    }
    
    private func addImageView() {
        mainContentView.addSubview(imageView)
        imageView.centerXToSuperview()
        imageView.topToSuperview().constant = 20
        imageView.size(CGSize(width: 60, height: 60))
    }
    
    private func addWarningLabel() {
        mainContentView.addSubview(warningLabel)
        warningLabel.topToBottom(of: imageView).constant = 16
        warningLabel.edgesToSuperview(excluding: [.top, .bottom])
    }
    
    private func addButtons() {
        mainContentView.addSubview(buttonsStackView)
        buttonsStackView.edgesToSuperview(excluding: .top)
        buttonsStackView.topToBottom(of: warningLabel).constant = 15
        buttonsStackView.addArrangedSubview(cancelButton)
        buttonsStackView.addArrangedSubview(loginButton)
        loginButton.height(50)
        cancelButton.height(50)
    }
}

// MARK: - Configure
extension LoginReminderViewController {
    private func configureContents() {
        loginButton.addTarget(self, action: #selector(touchUpInside(_:)), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(touchUpInside(_:)), for: .touchUpInside)
    }
}

// MARK: - Actions
extension LoginReminderViewController {
    @IBAction private func touchUpInside(_ sender: UIButton) {
        switch sender {
        case loginButton:
            viewModel.loginButtonAction()
        case cancelButton:
            viewModel.cancelButtonAction()
        default:
            break
        }
    }
}
