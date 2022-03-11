//
//  WalkthroughViewModel.swift
//  FodamyBerkay
//
//  Created by Mustafa Berkay Kaya on 11.03.2022.
//

import Foundation

protocol WalkthroughViewDataSource {
    func numberOfItemsAt(section: Int) -> Int
    func cellItemAt(indexPath: IndexPath) -> WalkthroughCellProtocol
}

protocol WalkthroughViewEventSource {}

protocol WalkthroughViewProtocol: WalkthroughViewDataSource, WalkthroughViewEventSource {}

final class WalkthroughViewModel: BaseViewModel<WalkthroughRouter>, WalkthroughViewProtocol {
    
    func numberOfItemsAt(section: Int) -> Int {
        return cellItems.count
    }
    
    func cellItemAt(indexPath: IndexPath) -> WalkthroughCellProtocol {
        return cellItems[indexPath.row]
    }
    
    private let cellItems: [WalkthroughCellProtocol] = []
    
}
