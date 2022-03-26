//
//  RecipeDetailHeaderView.swift
//  FodamyBerkay
//
//  Created by Mustafa Berkay Kaya on 25.03.2022.
//

import UIKit

public class RecipeCustomHeaderView: UIView {
    private let collectionView = UICollectionViewBuilder()
        .allowsMultipleSelection(false)
        .scrollDirection(.horizontal)
        .backgroundColor(.clear)
        .isPagingEnabled(true)
        .showsHorizontalScrollIndicator(false)
        .build()
    private let pageControl = UIPageControlBuilder<PageControl>()
        .build()
    
    // swiftlint:disable weak_delegate
    var photoBrowserDelegate: PhotoBrowserDelegate?
    // swiftlint:enable weak_delegate
    
    var recipeDetailHeaderData: [RecipeDetailHeaderCellProtocol] = [] {
        didSet {
            collectionView.reloadData()
            pageControl.numberOfPages = recipeDetailHeaderData.count
            pageControl.isHidden = pageControl.numberOfPages == 1
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        configureContents()
        configurePhotoBrowserDelegate()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubViews()
        configureContents()
        configurePhotoBrowserDelegate()
    }
}
// MARK: - UILayout
extension RecipeCustomHeaderView {
    private func addSubViews() {
        addSubview(collectionView)
        collectionView.edgesToSuperview()
        addSubview(pageControl)
        pageControl.bottom(to: collectionView)
        pageControl.centerX(to: collectionView)
    }
}
// MARK: - Configure
extension RecipeCustomHeaderView {
    private func configureContents() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(RecipeDetailHeaderCell.self)
    }
    
    private func configurePhotoBrowserDelegate() {
        photoBrowserDelegate = PhotoBrowserDelegate()
        photoBrowserDelegate?.willDismissAtPage = { [weak self] (index) in
            guard let self = self else { return }
            let indexPath = IndexPath(item: index, section: 0)
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            self.pageControl.currentPage = index
        }
    }
}

// MARK: - UICollectionViewDataSource
extension RecipeCustomHeaderView: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: RecipeDetailHeaderCell = collectionView.dequeueReusableCell(for: indexPath)
        let currentRecipeHeaderModel = recipeDetailHeaderData[indexPath.row]
        cell.set(with: currentRecipeHeaderModel)
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipeDetailHeaderData.count
    }
}
// MARK: - UICollectionViewDelegate
extension RecipeCustomHeaderView: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let delegate = photoBrowserDelegate else { return }
        let photos = recipeDetailHeaderData.map { $0.imageUrl }
        AppRouter.shared.presentSKPhotoBrowser(with: photos, delegate: delegate, initialPageIndex: indexPath.row)
    }
}
// MARK: - UICollectionViewDelegateFlowLayout
extension RecipeCustomHeaderView: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat.leastNonzeroMagnitude
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat.leastNonzeroMagnitude
    }
}
// MARK: - UIScrollViewDelegate
extension RecipeCustomHeaderView {
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}
