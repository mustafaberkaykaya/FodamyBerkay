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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
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
}

