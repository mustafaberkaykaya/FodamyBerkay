//
//  WalkthroughViewModel.swift
//  FodamyBerkay
//
//  Created by Mustafa Berkay Kaya on 11.03.2022.
//

protocol WalkthroughViewDataSource {
    func numberOfItemsAt(section: Int) -> Int
    func cellItemAt(indexPath: IndexPath) -> WalkthroughCellProtocol
    
    var currentPage: Int { get }
}

protocol WalkthroughViewEventSource {}

protocol WalkthroughViewProtocol: WalkthroughViewDataSource, WalkthroughViewEventSource {}

final class WalkthroughViewModel: BaseViewModel<WalkthroughRouter>, WalkthroughViewProtocol {
    var currentPage = 0
    
    func numberOfItemsAt(section: Int) -> Int {
        return cellItems.count
    }
    
    func cellItemAt(indexPath: IndexPath) -> WalkthroughCellProtocol {
        return cellItems[indexPath.row]
    }

    private let cellItems: [WalkthroughCellProtocol] = [WalkthroughCellModel(
                                                            image: .imgWalkthrough1,
                                                            titleText: L10n.WalkThrough._1Title,
                                                            descriptionText: L10n.WalkThrough._1Description),
                                                        WalkthroughCellModel(
                                                            image: .imgWalkthrough2,
                                                            titleText: L10n.WalkThrough._1Title,
                                                            descriptionText: L10n.WalkThrough._1Description),
                                                        WalkthroughCellModel(
                                                            image: .imgWalkthrough3,
                                                            titleText: L10n.WalkThrough._1Title,
                                                            descriptionText: L10n.WalkThrough._1Description),
                                                        WalkthroughCellModel(
                                                            image: .imgWalkthrough4,
                                                            titleText: L10n.WalkThrough._1Title,
                                                            descriptionText: L10n.WalkThrough._1Description)]
}
