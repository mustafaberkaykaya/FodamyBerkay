//
//  EmptyCell.swift
//  UIComponents
//
//  Created by Mustafa Berkay Kaya on 25.03.2022.
//

import UIKit

public class EmptyCell: UICollectionViewCell, ReusableView {
    private let descriptionLabel = UILabelBuilder()
        .textAlignment(.center)
        .numberOfLines(0)
        .font(.font(.nunitoSemiBold, size: .xLarge))
        .textColor(.appRaven)
        .build()
    
    public var infoText: String? {
        willSet {
            descriptionLabel.text = newValue
        }
    }
    
    private lazy var width: NSLayoutConstraint = {
        let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width)
        width.isActive = true
        return width
    }()
    
    weak var viewModel: EmptyCellProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubViews()
    }
    
    public override func systemLayoutSizeFitting(_ targetSize: CGSize,
                                                 withHorizontalFittingPriority
                                                 horizontalFittingPriority: UILayoutPriority,
                                                 verticalFittingPriority: UILayoutPriority) -> CGSize {
        width.constant = bounds.size.width
        return contentView.systemLayoutSizeFitting(CGSize(width: targetSize.width, height: 1))
    }
}

// MARK: - UILayout
extension EmptyCell {
    private func addSubViews() {
        contentView.backgroundColor = .appWhite
        contentView.addSubview(descriptionLabel)
        descriptionLabel.edgesToSuperview(insets: UIEdgeInsets(top: 50, left: 20, bottom: 50, right: 20))
    }
}

// MARK: - Set ViewModel
public extension EmptyCell {
    func set(viewModel: EmptyCellProtocol) {
        self.viewModel = viewModel
    }
}

