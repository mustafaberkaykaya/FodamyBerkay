//
//  HomeViewController.swift
//  FodamyBerkay
//
//  Created by Mustafa Berkay Kaya on 13.03.2022.
//

import UIKit

final class HomeViewController: BaseViewController<HomeViewModel> {
    private let imageView = UIImageViewBuilder().build()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
    }
    
}
// MARK: - UILayout
extension HomeViewController {
    private func addSubViews() {
        addNavigationBarLogo()
    }
   
    private func addNavigationBarLogo() {
        imageView.image = UIImage.imgLogoFodamy
        navigationItem.titleView = imageView
        imageView.contentMode = .scaleAspectFit
        imageView.width(110)
        imageView.height(30)
    }
}
