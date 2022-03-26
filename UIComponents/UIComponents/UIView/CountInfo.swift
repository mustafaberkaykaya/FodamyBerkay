//
//  CountInfo.swift
//  UIComponents
//
//  Created by Mustafa Berkay Kaya on 24.03.2022.
//

import UIKit

public class CountInfo: UIView {
    private let icon = UIButtonBuilder()
        .tintColor(.appCinder)
        .build()
    private let stackView = UIStackViewBuilder()
        .axis(.horizontal)
        .spacing(4)
        .build()
    private let countLabel = UILabelBuilder()
        .font(.font(.nunitoSemiBold, size: .medium))
        .textColor(.appRed)
        .textAlignment(.center)
        .build()
    private let descriptionLabel = UILabelBuilder()
        .font(.font(.nunitoSemiBold, size: .medium))
        .textColor(.appRaven)
        .textAlignment(.center)
        .build()
    
    public var iconButton: UIImage? {
        willSet {
            icon.setImage(newValue?.resize(to: .init(width: 20, height: 18), for: .scaleAspectFit), for: .normal)
        }
    }
    
    public var isSelected = false {
        willSet {
            icon.tintColor = newValue ? .appRed : .appCinder
        }
    }
    
    public var iconColor: UIColor? {
        willSet {
            icon.tintColor = newValue
        }
    }
    
    public var count: Int? {
        willSet {
            countLabel.text = newValue?.toString
        }
    }
    
    public var info: String? {
        willSet {
            descriptionLabel.text = newValue
        }
    }
    
    public var iconButtonTapped: VoidClosure?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        configureContents()
    }
    
    // swiftlint:disable fatal_error unavailable_function
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // swiftlint:enable fatal_error unavailable_function
}
// MARK: - UILayout
extension CountInfo {
    private func addSubViews() {
        backgroundColor = .white
        addIcon()
        addStackView()
    }
    
    private func addIcon() {
        addSubview(icon)
        icon.centerXToSuperview()
        icon.leadingToSuperview(relation: .equalOrGreater)
        icon.trailingToSuperview(relation: .equalOrLess)
        icon.topToSuperview().constant = 15
        icon.size(.init(width: 20, height: 18))
    }
    
    private func addStackView() {
        addSubview(stackView)
        stackView.topToBottom(of: icon).constant = 7
        stackView.centerXToSuperview()
        stackView.leadingToSuperview(relation: .equalOrGreater)
        stackView.trailingToSuperview(relation: .equalOrLess)
        stackView.bottomToSuperview().constant = -10
        stackView.addArrangedSubview(countLabel)
        stackView.addArrangedSubview(descriptionLabel)
    }
}
// MARK: - Actions
extension CountInfo {
    @IBAction private func iconButtonTapped(_ sender: Any?) {
        iconButtonTapped?()
    }
}

// MARK: - Configure
extension CountInfo {
    private func configureContents() {
        icon.addTarget(self, action: #selector(iconButtonTapped(_:)), for: .touchUpInside)
    }
}
