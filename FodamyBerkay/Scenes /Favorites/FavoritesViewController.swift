//
//  FavoritesViewController.swift
//  FodamyBerkay
//
//  Created by Mustafa Berkay Kaya on 23.03.2022.
//

import UIKit

final class FavoritesViewController: BaseViewController<FavoritesViewModel> {
    
    private let imageView = UIImageViewBuilder().build()
    private let collectionView = UICollectionViewBuilder()
        .showsVerticalScrollIndicator(false)
        .showsHorizontalScrollIndicator(false)
        .backgroundColor(.clear)
        .build()
    private let refreshControl = UIRefreshControl()
    private var loadingFooterView: ActivityIndicatorFooterView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
        viewModel.getFavorites()
        subscribeViewModel()
    }
    
}
// MARK: - UILayout
extension FavoritesViewController {
    private func addSubViews() {
        addNavigationBarLogo()
        addCollectionView()
    }
    
    private func addNavigationBarLogo() {
        imageView.image = UIImage.imgLogoFodamy
        navigationItem.titleView = imageView
        imageView.contentMode = .scaleAspectFit
        imageView.width(110)
        imageView.height(30)
    }
    
    private func addCollectionView() {
        view.addSubview(collectionView)
        collectionView.edgesToSuperview(usingSafeArea: true)
    }
}
// MARK: - Configure
extension FavoritesViewController {
    private func configureContents() {
        collectionView.dataSource = self
        collectionView.delegate = self
        refreshControl.addTarget(self, action: #selector(pullToRefreshValueChanged), for: .valueChanged)
        collectionView.register(FavoriteCell.self)
        collectionView.registerFooter(ActivityIndicatorFooterView.self)
        collectionView.refreshControl = refreshControl
        view.backgroundColor = .appSecondaryBackground
    }
}

// MARK: - SubscribeViewModel
extension FavoritesViewController {
    private func subscribeViewModel() {
        viewModel.reloadData = { [weak self] in
            self?.collectionView.reloadData()
        }
    }
}

// MARK: - Delegates and DataSource
extension FavoritesViewController: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y

        if position > scrollView.contentSize.height - scrollView.frame.size.height && viewModel.isPagingEnabled && viewModel.isRequestEnabled {
            viewModel.getFavorites()
        }
    }
}

extension FavoritesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsAt(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: FavoriteCell = collectionView.dequeueReusableCell(for: indexPath)
        let cellItem = viewModel.cellItemAt(indexPath: indexPath)
        cell.set(viewModel: cellItem)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        let footer: ActivityIndicatorFooterView = collectionView.dequeueReusableCell(ofKind: kind, for: indexPath)
        loadingFooterView = footer
        return footer
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        willDisplaySupplementaryView view: UICollectionReusableView,
                        forElementKind elementKind: String,
                        at indexPath: IndexPath) {
        if elementKind == UICollectionView.elementKindSectionFooter {
            self.loadingFooterView?.activityIndicator.startAnimating()
        }
    }
    func collectionView(_ collectionView: UICollectionView,
                        didEndDisplayingSupplementaryView view: UICollectionReusableView,
                        forElementOfKind elementKind: String,
                        at indexPath: IndexPath) {
        if elementKind == UICollectionView.elementKindSectionFooter {
            self.loadingFooterView?.activityIndicator.stopAnimating()
        }
    }
}

// MARK: - Actions
extension FavoritesViewController {
    @objc
    private func pullToRefreshValueChanged() {
        if refreshControl.isRefreshing {
            viewModel.pullToRefresh()
            refreshControl.endRefreshing()
        }
    }
}

extension FavoritesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width, height: 270)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForFooterInSection section: Int) -> CGSize {
        let height: CGFloat = viewModel.isPagingEnabled ? 100 : 0
        return CGSize(width: collectionView.bounds.size.width, height: height)
    }
}
