//
//  RecipeDetailUserView.swift
//  UIComponents
//
//  Created by Mustafa Berkay Kaya on 24.03.2022.
//

import UIKit

public class RecipeDetailUserView: UIView {
    private let userProfileImageView = UIImageViewBuilder()
        .cornerRadius(20)
        .clipsToBounds(true)
        .contentMode(.scaleToFill)
        .build()
    private let textStackView = UIStackViewBuilder()
        .axis(.vertical)
        .distribution(.fillEqually)
        .build()
    private let nameLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .medium))
        .textColor(.appCinder)
        .build()
    private let recipeAndFollowersCountLabel = UILabelBuilder()
        .font(.font(.nunitoSemiBold, size: .medium))
        .textColor(.appRaven)
        .build()
    private lazy var followButton = CustomButton.createPrimaryBorderedButton(style: .small)
    
    public var userProfileImageUrl: String? {
        willSet {
            if let url = newValue {
                userProfileImageView.setImage(url)
            } else {
                userProfileImageView.image = nil
            }
        }
    }
    
    public var recipeAndFollowerCountText: String? {
        willSet {
            recipeAndFollowersCountLabel.text = newValue
        }
    }
    
    public var username: String? {
        willSet {
            nameLabel.text = newValue
        }
    }
    
    public var isFollowButtonHidden: Bool? {
        willSet {
            followButton.isHidden = newValue ?? false
        }
    }
    
    public enum UserViewType {
        case withFollowButton
        case withoutFollowButton
    }
    
    let userViewType: UserViewType
    
    /// Only use this variable when you enable followButton
    public var isFollowing = false {
        didSet {
            updateFollowButtonStation()
        }
    }
    
    public init(userViewType: UserViewType) {
        self.userViewType = userViewType
        super.init(frame: .zero)
        addSubViews()
    }
    
    // swiftlint:disable fatal_error unavailable_function
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // swiftlint:enable fatal_error unavailable_function
}

// MARK: - UILayout
extension RecipeDetailUserView {
    private func addSubViews() {
        backgroundColor = .appWhite
        addUserProfileImage()
        addTextStackView()
        addElementsToStackView()

        switch userViewType {
        case .withFollowButton:
            addSubview(followButton)
            followButton.trailingToSuperview().constant = -15
            followButton.leadingToTrailing(of: textStackView).constant = 10
            followButton.centerYToSuperview()
            followButton.width(120)
            updateFollowButtonStation()
        case .withoutFollowButton:
            textStackView.trailingToSuperview().constant = -15
        }
    }
    
    private func addUserProfileImage() {
        addSubview(userProfileImageView)
        userProfileImageView.edgesToSuperview(excluding: .trailing, insets: .init(top: 15, left: 15, bottom: 15, right: 15))
        userProfileImageView.size(.init(width: 40, height: 40))
    }
    
    private func addTextStackView() {
        addSubview(textStackView)
        textStackView.leadingToTrailing(of: userProfileImageView).constant = 10
        textStackView.centerYToSuperview()
    }
    
    private func addElementsToStackView() {
        textStackView.addArrangedSubview(nameLabel)
        textStackView.addArrangedSubview(recipeAndFollowersCountLabel)
    }
}

// MARK: - Configure
extension RecipeDetailUserView {
    private func updateFollowButtonStation() {
        if isFollowing {
            followButton.setTitle(L10n.UserView.following, for: .normal)
            followButton.setTitleColor(.white, for: .normal)
            followButton.backgroundColor = .appRed
        } else {
            followButton.setTitle(L10n.UserView.follow, for: .normal)
            followButton.setTitleColor(.appRed, for: .normal)
            followButton.backgroundColor = .appWhite
        }
    }
}

