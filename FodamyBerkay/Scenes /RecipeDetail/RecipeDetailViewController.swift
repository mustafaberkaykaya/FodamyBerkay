//
//  RecipeDetailViewController.swift
//  FodamyBerkay
//
//  Created by Mustafa Berkay Kaya on 24.03.2022.
//

import UIKit

final class RecipeDetailViewController: BaseViewController<RecipeDetailViewModel> {
    private let scrollView = UIScrollViewBuilder()
        .showsHorizontalScrollIndicator(false)
        .showsVerticalScrollIndicator(false)
        .alwaysBounceVertical(false)
        .build()
    private let mainStackView = UIStackViewBuilder()
        .axis(.vertical)
        .spacing(15)
        .build()
    private let recipeCustomHeaderView = RecipeCustomHeaderView()
    private let recipeDetailDescriptionView = RecipeDetailDescriptionTitlesView()
    private let commentLikeInfoStackView = UIStackViewBuilder()
        .axis(.horizontal)
        .spacing(1)
        .distribution(.fillEqually)
        .build()
    private let commentCountView = CountInfo()
    private let likeCountView = CountInfo()
    private let userView = RecipeDetailUserView(userViewType: .withFollowButton)
    private let materialsView = RecipeDetailDescriptionView()
    private let constructionView = RecipeDetailDescriptionView()
    private let commentsContainerView = UIViewBuilder()
        .backgroundColor(.appWhite)
        .build()
    private let commentsTitleLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .xLarge))
        .textColor(.appCinder)
        .text(L10n.RecipeDetail.commentsTitle)
        .build()
    private let commentsSeparatorLine = UIViewBuilder()
        .backgroundColor(.appZircon)
        .build()
    private let commentsCollectionView: DynamicCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let width = UIScreen.main.bounds.size.width
        layout.estimatedItemSize = CGSize(width: width, height: 10)
        let collectionView = DynamicCollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .appSecondaryBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(RecipeDetailCommentCell.self)
        collectionView.register(EmptyCell.self)
        return collectionView
    }()
    private let commentButtonContainer = UIViewBuilder()
        .backgroundColor(.clear)
        .build()
    private let commentButton = CustomButton.createPrimaryButton(style: .large)

    override func viewDidLoad() {
        super.viewDidLoad()
        subscribeViewModel()
        subscribeActions()
        configureContents()
        setLocalize()
        addSubviews()
        
        viewModel.getRecipeDetailComments()
        viewModel.getRecipeDetail()
    }
    
    private func subscribeViewModel() {
        viewModel.reloadDetailData = { [weak self] in
            self?.fillToDatas()
        }
        viewModel.reloadCommentData = { [weak self] in
            self?.commentsCollectionView.reloadData()
        }
        
        viewModel.toggleIsLiked = { [weak self] in
            guard let self = self else { return }
            self.viewModel.isLiked.toggle()
            
            let isLiked = self.viewModel.isLiked
            if isLiked {
                self.likeCountView.iconColor = .appRed
                self.viewModel.likeCount? += 1
                self.likeCountView.count = self.viewModel.likeCount
            } else {
                self.likeCountView.iconColor = .appCinder
                self.viewModel.likeCount? -= 1
                self.likeCountView.count = self.viewModel.likeCount
            }
        }
        viewModel.toggleIsFollowing = { [weak self] in
            guard let self = self else { return }
            self.userView.isFollowing.toggle()
            self.viewModel.isFollowing.toggle()
            
            let isFollowing = self.viewModel.isFollowing
            if isFollowing {
                self.viewModel.userFollowedCount? += 1
            } else {
                self.viewModel.userFollowedCount? -= 1
            }
            
            self.userView.recipeAndFollowerCountText = self.viewModel.recipeAndFollowerCountText
        }
    }
}

// MARK: - UILayout
extension RecipeDetailViewController {
    private func addSubviews() {
        view.backgroundColor = .appSecondaryBackground
        addScrollView()
        addMainStackView()
        addHeader()
        addDescriptionTitleView()
        addCommentLikeInfoStackView()
        addUserInfoView()
        addMaterialsView()
        addConstructionView()
        addCommentsContainer()
        addCommentButton()
    }
    
    private func addScrollView() {
        view.addSubview(scrollView)
        scrollView.topToSuperview(usingSafeArea: true)
        scrollView.leadingToSuperview()
        scrollView.trailingToSuperview()
        scrollView.bottomToSuperview()
    }
    
    private func addMainStackView() {
        scrollView.addSubview(mainStackView)
        mainStackView.widthToSuperview()
        mainStackView.edgesToSuperview()
    }
    
    private func addHeader() {
        mainStackView.addArrangedSubview(recipeCustomHeaderView)
        recipeCustomHeaderView.height(375)
    }
    
    private func addDescriptionTitleView() {
        mainStackView.setCustomSpacing(0, after: recipeCustomHeaderView)
        mainStackView.addArrangedSubview(recipeDetailDescriptionView)
        mainStackView.setCustomSpacing(1, after: recipeDetailDescriptionView)
    }
    
    private func addCommentLikeInfoStackView () {
        mainStackView.addArrangedSubview(commentLikeInfoStackView)
        commentLikeInfoStackView.addArrangedSubview(commentCountView)
        commentLikeInfoStackView.addArrangedSubview(likeCountView)
    }
    
    private func addUserInfoView() {
        mainStackView.addArrangedSubview(userView)
    }
    
    private func addMaterialsView() {
        mainStackView.addArrangedSubview(materialsView)
    }
    
    private func addConstructionView() {
        mainStackView.addArrangedSubview(constructionView)
    }
    
    private func addCommentsContainer() {
        mainStackView.addArrangedSubview(commentsContainerView)
        commentsContainerView.addSubview(commentsTitleLabel)
        commentsTitleLabel.edgesToSuperview(excluding: .bottom, insets: .init(top: 11, left: 15, bottom: 11, right: 15))
        commentsContainerView.addSubview(commentsSeparatorLine)
        commentsSeparatorLine.height(1)
        commentsSeparatorLine.edgesToSuperview(excluding: [.top, .bottom])
        commentsSeparatorLine.topToBottom(of: commentsTitleLabel).constant = 11
        commentsContainerView.addSubview(commentsCollectionView)
        commentsCollectionView.edgesToSuperview(excluding: .top)
        commentsCollectionView.topToBottom(of: commentsSeparatorLine)
    }
    
    private func addCommentButton() {
        mainStackView.addArrangedSubview(commentButtonContainer)
        commentButtonContainer.addSubview(commentButton)
        commentButton.edgesToSuperview(insets: .init(top: 0, left: 15, bottom: 15, right: 15))
    }
}

// MARK: - Actions
extension RecipeDetailViewController {
    private func subscribeActions() {
        likeCountView.iconButtonTapped = { [weak self] in
            guard let self = self else { return }
            self.viewModel.likeButtonTapped()
        }
        userView.followButtonTapped = { [weak self] in
            guard let self = self else { return }
            self.viewModel.followButtonTapped()
        }
    }
    @objc
    private func commentButtonTapped() {
        viewModel.commentButtonTapped()
    }
}
// MARK: - Configure and Localize
extension RecipeDetailViewController {
    private func configureContents() {
        commentsCollectionView.delegate = self
        commentsCollectionView.dataSource = self
        commentButton.addTarget(self, action: #selector(commentButtonTapped), for: .touchUpInside)
    }
    
    private func setLocalize() {
        commentCountView.info = L10n.RecipeDetail.comment
        likeCountView.info = L10n.RecipeDetail.like
        commentCountView.iconButton = .icComment
        likeCountView.iconButton = .icHeart
        materialsView.icon = .icRestaurant
        materialsView.title = L10n.RecipeDetail.materials
        constructionView.icon = .icClock
        constructionView.title = L10n.RecipeDetail.construction
        commentButton.setTitle(L10n.RecipeDetail.addComment, for: .normal)
    }
    
    private func fillToDatas() {
        navigationItem.title = viewModel.recipeName
        recipeCustomHeaderView.recipeDetailHeaderData = viewModel.recipeHeaderCellItems
        recipeDetailDescriptionView.recipeNameText = viewModel.recipeName
        recipeDetailDescriptionView.categoryNameText = viewModel.categoryName
        recipeDetailDescriptionView.timeText = viewModel.timeDifferenceText
        commentCountView.count = viewModel.commentCount
        likeCountView.count = viewModel.likeCount
        likeCountView.iconColor = viewModel.isLiked ? .appRed : .appCinder
        userView.username = viewModel.username
        userView.recipeAndFollowerCountText = viewModel.recipeAndFollowerCountText
        userView.userProfileImageUrl = viewModel.userImageUrl
        userView.isFollowing = viewModel.isFollowing
        materialsView.iconSubtitle = viewModel.numberOfPeople
        materialsView.info = viewModel.ingredients
        constructionView.iconSubtitle = viewModel.time
        constructionView.info = viewModel.steps
        if DefaultsKey.userId.value == viewModel.userId {
            userView.isFollowButtonHidden = true
        }
    }
}

// MARK: - UICollectionView DataSource
extension RecipeDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if viewModel.numberOfItemsAt(section: section) == 0 {
            return 1
        } else if viewModel.numberOfItemsAt(section: section) > 3 {
            return 3
        }
        return viewModel.numberOfItemsAt(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if viewModel.numberOfItemsAt(section: 0) == 0 {
            let cell: EmptyCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.infoText = L10n.RecipeDetail.noComment
            return cell
        }
        let cell: RecipeDetailCommentCell = collectionView.dequeueReusableCell(for: indexPath)
        let cellItem = viewModel.cellItemAt(indexPath: indexPath)
        cell.set(viewModel: cellItem)
        cell.isThreePointButtonHidden = true
        return cell
    }
}

// MARK: - UICollectionView DelegateFlowLayout
extension RecipeDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        .zero
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        .zero
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 195)
    }
}
