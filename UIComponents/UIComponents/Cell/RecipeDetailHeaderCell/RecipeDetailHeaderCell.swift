//
//  RecipeDetailHeaderCell.swift
//  UIComponents
//
//  Created by Mustafa Berkay Kaya on 24.03.2022.
//

import UIKit

public class RecipeDetailHeaderCell: UICollectionViewCell, ReusableView {
    private let imageView = UIImageViewBuilder()
        .backgroundColor(.clear)
        .contentMode(.scaleAspectFill)
        .clipsToBounds(true)
        .build()
    private let editorChoiceBadge = UIImageViewBuilder()
        .contentMode(.center)
        .image(UIImage.imgEditorsPick.resize(to: .init(width: 20, height: 24), for: .scaleAspectFit))
        .cornerRadius(20)
        .shadowColor(UIColor.appCinder.cgColor)
        .shadowOpacity(0.40)
        .shadowOffset(.zero)
        .shadowRadius(4)
        .backgroundColor(.appWhite)
        .build()
    
    weak var viewModel: RecipeDetailHeaderCellProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubViews()
    }
    
    public func set(with viewModel: RecipeDetailHeaderCellProtocol) {
        imageView.setImage(viewModel.imageUrl)
        editorChoiceBadge.isHidden = !viewModel.isEditorChoice
    }
}
// MARK: - UILayout
extension RecipeDetailHeaderCell {
    private func addSubViews() {
        addImageView()
        addBadge()
    }
    
    private func addImageView() {
        contentView.addSubview(imageView)
        imageView.edgesToSuperview()
    }
    
    private func addBadge() {
        contentView.addSubview(editorChoiceBadge)
        editorChoiceBadge.top(to: imageView).constant = 15
        editorChoiceBadge.trailing(to: imageView).constant = -15
        editorChoiceBadge.size(.init(width: 40, height: 40))
    }
}


