//
//  RecipeDetailDescriptionTitlesView.swift
//  UIComponents
//
//  Created by Mustafa Berkay Kaya on 24.03.2022.
//

import UIKit

public class RecipeDetailDescriptionTitlesView: UIView {
    private let descriptionStackView = UIStackViewBuilder()
        .axis(.vertical)
        .build()
    private let recipeNameLabel = UILabelBuilder()
        .textColor(.appCinder)
        .font(.font(.nunitoBold, size: .xLarge))
        .build()
    private let recipeCategoryLabel = UILabelBuilder()
        .textColor(.appRaven)
        .font(.font(.nunitoSemiBold, size: .xLarge))
        .build()
    private let timeLabel = UILabelBuilder()
        .textColor(.appRaven)
        .font(.font(.nunitoSemiBold, size: .medium))
        .textAlignment(.right)
        .build()
    
    public var recipeNameText: String? {
        willSet {
            recipeNameLabel.text = newValue
        }
    }
    
    public var categoryNameText: String? {
        willSet {
            recipeCategoryLabel.text = newValue
        }
    }
    
    public var timeText: String? {
        willSet {
            timeLabel.text = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubViews()
    }
}

// MARK: - UILayout
extension RecipeDetailDescriptionTitlesView {
    private func addSubViews() {
        backgroundColor = .appWhite
        addStackView()
        addLabel()
    }
    
    private func addStackView() {
        addSubview(descriptionStackView)
        descriptionStackView.edgesToSuperview(excluding: .trailing, insets: UIEdgeInsets(top: 11, left: 15, bottom: 11, right: 0))
        descriptionStackView.addArrangedSubview(recipeNameLabel)
        descriptionStackView.addArrangedSubview(recipeCategoryLabel)
    }
    
    private func addLabel() {
        addSubview(timeLabel)
        timeLabel.leadingToTrailing(of: descriptionStackView).constant = 10
        timeLabel.trailingToSuperview().constant = -15
        timeLabel.centerYToSuperview()
    }
}
