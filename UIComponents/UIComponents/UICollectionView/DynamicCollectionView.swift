//
//  DynamicCollectionView.swift
//  UIComponents
//
//  Created by Mustafa Berkay Kaya on 25.03.2022.
//

import UIKit

public class DynamicCollectionView: UICollectionView {
    public override func layoutSubviews() {
        super.layoutSubviews()
        if !(__CGSizeEqualToSize(bounds.size, self.intrinsicContentSize)) {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    public override var intrinsicContentSize: CGSize {
        return contentSize
    }

}
