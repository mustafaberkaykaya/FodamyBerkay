//
//  SKPhotoBrowserRoute.swift
//  FodamyBerkay
//
//  Created by Mustafa Berkay Kaya on 25.03.2022.
//

import SKPhotoBrowser

protocol SKPhotoBrowserRoute {
    func presentSKPhotoBrowser(with photos: [String], viewController: UIViewController, initialPageIndex: Int, delegate: PhotoBrowserDelegate)
}

extension SKPhotoBrowserRoute where Self: RouterProtocol {
    
    func presentSKPhotoBrowser(with photos: [String], viewController: UIViewController, initialPageIndex: Int, delegate: PhotoBrowserDelegate) {
        let skPhotos = photos.map { SKPhoto.photoWithImageURL($0) }
        let photoBrowser = SKPhotoBrowser(photos: skPhotos, initialPageIndex: initialPageIndex)
        photoBrowser.delegate = delegate
        viewController.present(photoBrowser, animated: true)
    }
    
}
