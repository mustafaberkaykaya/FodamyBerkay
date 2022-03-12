//
//  WalkthroughViewController.swift
//  FodamyBerkay
//
//  Created by Mustafa Berkay Kaya on 11.03.2022.
//

final class WalkthroughViewController: BaseViewController<WalkthroughViewModel> {
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        collectionView.isPagingEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(WalkthroughCell.self)
        collectionView.backgroundColor = .white
        return collectionView
      }()
    private let nextButton = CustomButton.createPrimaryButton(style: .large)
    private let pageControl = UIPageControlBuilder<PageControl>()
        .numberOfPages(4)
        .build()
    private let dismissButton = UIButtonBuilder()
        .image(UIImage.icClose.withRenderingMode(.alwaysTemplate))
        .tintColor(.appCinder)
        .build()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
        setLocalize()
        addSubViews()
    }
}

// MARK: - UILayout
extension WalkthroughViewController {
    private func addSubViews() {
        addNextButton()
        addPageControl()
        addCollectionView()
        addDismissButton()
    }
    
    private func addNextButton() {
        view.addSubview(nextButton)
        nextButton.height(60)
        nextButton.bottomToSuperview(usingSafeArea: true)
        nextButton.leadingToSuperview().constant = 15
        nextButton.trailingToSuperview().constant = -15
    }
    
    private func addPageControl() {
        view.addSubview(pageControl)
        pageControl.centerXToSuperview()
        pageControl.bottomToTop(of: nextButton).constant = -20
        
    }
    
    private func addCollectionView() {
        view.addSubview(collectionView)
        collectionView.topToSuperview()
        collectionView.leadingToSuperview()
        collectionView.trailingToSuperview()
        collectionView.bottomToTop(of: pageControl).constant = -68
    }
    
    private func addDismissButton() {
        view.addSubview(dismissButton)
        dismissButton.topToSuperview(usingSafeArea: true).constant = 25
        dismissButton.trailingToSuperview().constant = -20
    }
}

// MARK: - Configure and Localize
extension WalkthroughViewController {
    private func configureContents() {
        collectionView.delegate = self
        collectionView.dataSource = self
        pageControl.isUserInteractionEnabled = false
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    private func setLocalize() {
        nextButton.setTitle(L10n.WalkThrough.nextButton, for: .normal)
    }
}

// MARK: - Actions
extension WalkthroughViewController {
    @objc
    private func nextButtonTapped() {
        if pageControl.currentPage == viewModel.numberOfItemsAt(section: 0) - 1 {
           print("geç yeni ekrana")
        } else {
            pageControl.currentPage += 1
            let indexPath = IndexPath(item: pageControl.currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
}

// MARK: - UICollectionViewDataSource
extension WalkthroughViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsAt(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: WalkthroughCell = collectionView.dequeueReusableCell(for: indexPath)
        let cellItem = viewModel.cellItemAt(indexPath: indexPath)
        cell.set(viewModel: cellItem)
        return cell
    }
}

// swiftlint:disable line_length
// MARK: - UICollectionViewDelegateFlowLayout
extension WalkthroughViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        pageControl.currentPage = Int(scrollView.contentOffset.x / width)
        
        if pageControl.currentPage == viewModel.numberOfItemsAt(section: 0) - 1 {
            nextButton.setTitle(L10n.WalkThrough.startButton, for: .normal)
        } else {
            nextButton.setTitle(L10n.WalkThrough.nextButton, for: .normal)
        }
    }
}
// swiftlint:enable line_length
