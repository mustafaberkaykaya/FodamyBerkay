//
//  WalkthroughCell.swift
//  UIComponents
//
//  Created by Mustafa Berkay Kaya on 11.03.2022.
//

public class WalkthroughCell: UICollectionViewCell, ReusableView {
    
    private let imageView = UIImageViewBuilder().build()
    private let descriptionView = UIViewBuilder().build()
    private let titleLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .xxLarge))
        .textAlignment(.center)
        .numberOfLines(0)
        .textColor(.appCinder).build()
    private let descriptionLabel = UILabelBuilder()
        .font(.font(.nunitoSemiBold, size: .xLarge))
        .textAlignment(.center)
        .numberOfLines(0)
        .textColor(.appRaven).build()
    private let descriptionStackView = UIStackViewBuilder()
        .spacing(10)
        .axis(.vertical)
        .build()
    
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
        addSubViews()
    }
    
    public func set(viewModel: WalkthroughCellProtocol) {
        self.viewModel = viewModel
        titleLabel.text = viewModel.titleText
        descriptionLabel.text = viewModel.descriptionText
        imageView.image = viewModel.image
    }
}

// MARK: - UILayout
extension WalkthroughCell {
    private func addSubViews() {
        addImageView()
        addDescriptionView()
        addDescriptionStackView()
    }
    
    private func addImageView() {
        contentView.addSubview(imageView)
        imageView.centerInSuperview()
    }
    
    private func addDescriptionView() {
        contentView.addSubview(descriptionView)
        descriptionView.topToBottom(of: imageView)
        descriptionView.edgesToSuperview(excluding: .top)
    }
    
    private func addDescriptionStackView() {
        descriptionView.addSubview(descriptionStackView)
        descriptionStackView.addArrangedSubview(titleLabel)
        descriptionStackView.addArrangedSubview(descriptionLabel)
        descriptionStackView.leadingToSuperview().constant = 50
        descriptionStackView.trailingToSuperview().constant = -50
        descriptionStackView.centerYToSuperview()   
    }
}


