//
//  RecipeDetailCommentCell.swift
//  UIComponents
//
//  Created by Mustafa Berkay Kaya on 25.03.2022.
//

import UIKit

public class RecipeDetailCommentCell: UICollectionViewCell, ReusableView {
    private let userInfoView = UserInfoView(userViewType: .withoutFollowButton)
    private let timeLabel = UILabelBuilder()
        .font(.font(.nunitoSemiBold, size: .xSmall))
        .textColor(.appRaven)
        .build()
    private let commentLabel = UILabelBuilder()
        .font(.font(.nunitoSemiBold, size: .medium))
        .textColor(.appCinder)
        .numberOfLines(0)
        .build()
    private let threePointButton = UIButtonBuilder()
        .backgroundColor(.clear)
        .image(UIImage.icMore.withRenderingMode(.alwaysTemplate))
        .tintColor(.appCinder)
        .build()
    
    private lazy var width: NSLayoutConstraint = {
        let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width)
        width.isActive = true
        return width
    }()
    
    public var isThreePointButtonHidden: Bool? {
        willSet {
            threePointButton.isHidden = newValue ?? false
        }
    }
    
    weak var viewModel: RecipeDetailCommentCellProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubViews()
    }

    public override func prepareForReuse() {
        super.prepareForReuse()
        self.userInfoView.userImageUrl = nil
        self.userInfoView.username = nil
        self.userInfoView.recipeAndFollowerCountText = nil
        self.timeLabel.text = nil
        self.threePointButton.isHidden = true
        self.commentLabel.text = nil
    }
    
    public func set(viewModel: RecipeDetailCommentCellProtocol) {
        self.viewModel = viewModel
        self.userInfoView.userImageUrl = viewModel.imageUrl
        self.userInfoView.username = viewModel.username
        self.userInfoView.recipeAndFollowerCountText = viewModel.recipeAndFollowerCountText
        self.timeLabel.text = viewModel.timeDifferenceText
        self.commentLabel.text = viewModel.commentText
        self.threePointButton.isHidden = !viewModel.isOwner
        self.viewModel?.commentTextDidChanged = { [weak self] in
            self?.commentLabel.text = self?.viewModel?.commentText
        }
    }
}

// MARK: - UILayout
extension RecipeDetailCommentCell {
    private func addSubViews() {
        backgroundColor = .white
        addUserInfoView()
        addTimeLabel()
        addCommentLabel()
        addThreePointButton()
    }
    
    private func addUserInfoView() {
        contentView.addSubview(userInfoView)
        userInfoView.edgesToSuperview(excluding: [.bottom, .trailing])
        userInfoView.height(70)
    }
    
    private func addTimeLabel() {
        contentView.addSubview(timeLabel)
        timeLabel.topToBottom(of: userInfoView)
        timeLabel.leadingToSuperview().constant = 15
        timeLabel.trailingToSuperview().constant = -15
    }
    
    private func addCommentLabel() {
        contentView.addSubview(commentLabel)
        commentLabel.topToBottom(of: timeLabel).constant = 7
        commentLabel.edgesToSuperview(excluding: .top, insets: UIEdgeInsets(top: 0, left: 15, bottom: 5, right: 15))
    }
    
    private func addThreePointButton() {
        contentView.addSubview(threePointButton)
        threePointButton.topToSuperview(offset: 10)
        threePointButton.trailingToSuperview(offset: 15)
        threePointButton.leadingToTrailing(of: userInfoView).constant = 15
        threePointButton.width(18)
        threePointButton.height(10)
    }
    
    public override func systemLayoutSizeFitting(_ targetSize: CGSize,
                                                 withHorizontalFittingPriority
                                                 horizontalFittingPriority: UILayoutPriority,
                                                 verticalFittingPriority: UILayoutPriority) -> CGSize {
        width.constant = bounds.size.width
        return contentView.systemLayoutSizeFitting(CGSize(width: targetSize.width, height: 1))
    }
}

