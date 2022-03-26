//
//  RecipeDetailDescriptionView.swift
//  UIComponents
//
//  Created by Mustafa Berkay Kaya on 24.03.2022.
//

import UIKit

public class RecipeDetailDescriptionView: UIView {
    private let containerView = UIViewBuilder()
        .backgroundColor(.appWhite)
        .build()
    private let titleLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .xLarge))
        .textColor(.appCinder)
        .build()
    private let stackView = UIStackViewBuilder()
        .spacing(2)
        .axis(.vertical)
        .alignment(.center)
        .build()
    private let iconImage = UIImageViewBuilder()
        .cornerRadius(17)
        .clipsToBounds(true)
        .borderWidth(2)
        .borderColor(UIColor.appZircon.cgColor)
        .contentMode(.center)
        .tintColor(.appCinder)
        .size(.init(width: 34, height: 34))
        .build()
    private let iconSubtitleLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .small))
        .textColor(.appRaven)
        .build()
    private let separatorLine = UIViewBuilder()
        .backgroundColor(.appZircon)
        .build()
    private let descriptionLabel = UILabelBuilder()
        .font(.font(.nunitoSemiBold, size: .xLarge))
        .textColor(.appCinder)
        .numberOfLines(0)
        .build()
    
    public var title: String? {
        willSet {
            titleLabel.text = newValue
        }
    }
    
    public var icon: UIImage? {
        willSet {
            iconImage.image = newValue?.resize(to: .init(width: 18, height: 18))
        }
    }
    
    public var iconSubtitle: String? {
        willSet {
            iconSubtitleLabel.text = newValue
        }
    }
    
    public var info: String? {
        willSet {
            descriptionLabel.text = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubViews()
    }
}

// MARK: - UILayout
extension RecipeDetailDescriptionView {
    private func addSubViews() {
        addContainer()
        addTitleLabel()
        addStackView()
        addLine()
        addDescription()
    }
    
    private func addContainer() {
        backgroundColor = .white
        addSubview(containerView)
        containerView.edgesToSuperview(excluding: .bottom)
        containerView.height(78)
    }
    
    private func addTitleLabel() {
        containerView.addSubview(titleLabel)
        titleLabel.leadingToSuperview().constant = 15
        titleLabel.centerYToSuperview()
    }
    
    private func addStackView() {
        containerView.addSubview(stackView)
        stackView.trailingToSuperview().constant = -15
        stackView.centerYToSuperview()
        stackView.addArrangedSubview(iconImage)
        stackView.addArrangedSubview(iconSubtitleLabel)
    }
    
    private func addLine() {
        addSubview(separatorLine)
        separatorLine.height(1)
        separatorLine.topToBottom(of: containerView)
        separatorLine.edgesToSuperview(excluding: [.top, .bottom])
    }
    
    private func addDescription() {
        addSubview(descriptionLabel)
        descriptionLabel.topToBottom(of: separatorLine, offset: 10)
        descriptionLabel.edgesToSuperview(excluding: .top, insets: .init(top: 0, left: 15, bottom: 10, right: 15))
    }
}
