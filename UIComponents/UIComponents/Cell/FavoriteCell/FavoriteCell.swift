//
//  FavoriteCell.swift
//  UIComponents
//
//  Created by Mustafa Berkay Kaya on 23.03.2022.
//

import UIKit

public class FavoriteCell: UICollectionViewCell, ReusableView {
    private let headerView = UIViewBuilder()
        .backgroundColor(.white)
        .build()
    private let categoryIconImage = UIImageViewBuilder()
        .contentMode(.scaleAspectFit)
        .build()
    private let categoryLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .medium))
        .textColor(.appCinder)
        .build()
    private let seeAllButton = UIButtonBuilder()
        .title(L10n.FavoriteCell.button)
        .titleColor(.appRed)
        .titleFont(.font(.nunitoBold, size: .small))
        .backgroundColor(.clear)
        .build()
    private let seperatorLine = UIViewBuilder()
        .backgroundColor(.appZircon)
        .build()
    private let collectionView = UICollectionViewBuilder()
        .scrollDirection(.horizontal)
        .backgroundColor(.white)
        .showsVerticalScrollIndicator(false)
        .build()
    
    weak var viewModel: FavoriteCellProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubViews()
        configureContents()
    }
    
    public func set(viewModel: FavoriteCellProtocol) {
        self.viewModel = viewModel
        categoryLabel.text = viewModel.headerCategoryName
        categoryIconImage.setImage(viewModel.headerLeftImageURL)
        self.collectionView.reloadData()
    }
}
// MARK: - Layout
extension FavoriteCell {
    private func addSubViews() {
        addHeaderView()
        addCategoryIcon()
        addCategoryLabel()
        addButton()
        addSeperatorLine()
        addCollectionView()
    }
    
    private func addHeaderView() {
        contentView.addSubview(headerView)
        headerView.edgesToSuperview(excluding: .bottom)
        headerView.height(44)
    }
    
    private func addCategoryIcon() {
        headerView.addSubview(categoryIconImage)
        categoryIconImage.edgesToSuperview(excluding: .right, insets: UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 0))
        categoryIconImage.width(24)
        categoryIconImage.height(24)
    }
    
    private func addCategoryLabel() {
        headerView.addSubview(categoryLabel)
        categoryLabel.centerYToSuperview()
        categoryLabel.leadingToTrailing(of: categoryIconImage).constant = 5
    }
    
    private func addButton() {
        headerView.addSubview(seeAllButton)
        seeAllButton.trailingToSuperview().constant = -15
        seeAllButton.centerYToSuperview()
    }
    
    private func addSeperatorLine() {
        contentView.addSubview(seperatorLine)
        seperatorLine.topToBottom(of: headerView)
        seperatorLine.width(contentView.frame.width)
        seperatorLine.height(1)
    }
    
    private func addCollectionView() {
        contentView.addSubview(collectionView)
        collectionView.edgesToSuperview(excluding: .top)
        collectionView.topToBottom(of: seperatorLine)
    }
}

// MARK: - Configure
extension FavoriteCell {
    private func configureContents() {
        seeAllButton.addTarget(self, action: #selector(seeAllButtonTapped(_:)), for: .touchUpInside)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(FavoriteInRecipeCell.self)
    }
}
// MARK: - Actions
extension FavoriteCell {
    @objc
    private func seeAllButtonTapped(_ sender: UIButton) {
        
    }
}
// MARK: - UICollectionViewDataSource
extension FavoriteCell: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.getCount() ?? 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: FavoriteInRecipeCell = collectionView.dequeueReusableCell(for: indexPath)
        if let cellItem = viewModel?.cellItems[indexPath.row] {
            cell.set(viewModel: cellItem)
        }
        return cell
    }
}
// MARK: - UICollectionViewDelegate
extension FavoriteCell: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAt indexPath: IndexPath) -> CGSize {
    return .init(width: 150, height: 195)
}

    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 15
}

    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               insetForSectionAt section: Int) -> UIEdgeInsets {
    return .left(15)
    
    }
}


