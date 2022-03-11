//
//  WalkthroughCell.swift
//  UIComponents
//
//  Created by Mustafa Berkay Kaya on 11.03.2022.
//

import UIKit

public class WalkthroughCell: UICollectionViewCell, ReusableView {
    
    weak var viewModel: WalkthroughCellProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
    }
    
    private func configureContents() {
        
    }
    
    public func set(viewModel: WalkthroughCellProtocol) {
        self.viewModel = viewModel
        
    }
    
}
