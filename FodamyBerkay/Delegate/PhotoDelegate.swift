//
//  PhotoDelegate.swift
//  FodamyBerkay
//
//  Created by Mustafa Berkay Kaya on 27.03.2022.
//
import SKPhotoBrowser

final class PhotoBrowserDelegate: SKPhotoBrowserDelegate {

    var willDismissAtPage: IntClosure?

    func willDismissAtPageIndex(_ index: Int) {
        if let didDismiss = willDismissAtPage {
            didDismiss(index)
        }
    }
}
