//
//  FavoritesViewModel.swift
//  FodamyBerkay
//
//  Created by Mustafa Berkay Kaya on 23.03.2022.
//

import Foundation

protocol FavoritesViewDataSource {
    func numberOfItemsAt(section: Int) -> Int
    func cellItemAt(indexPath: IndexPath) -> FavoriteCellProtocol
}

protocol FavoritesViewEventSource {
    var reloadData: VoidClosure? { get set }
}

protocol FavoritesViewProtocol: FavoritesViewDataSource, FavoritesViewEventSource {}

final class FavoritesViewModel: BaseViewModel<FavoritesRouter>, FavoritesViewProtocol {
    var page = 1
    var isRequestEnabled = false
    var isPagingEnabled = false
    var reloadData: VoidClosure?
    private var cellItems: [FavoriteCellModel] = []

    func numberOfItemsAt(section: Int) -> Int {
            return cellItems.count
    }

    func cellItemAt(indexPath: IndexPath) -> FavoriteCellProtocol {
        return cellItems[indexPath.row]
    }
    
    func getFavorites() {
        let request = GetRecipeCategoriesRequest(page: page)
        self.isRequestEnabled = false

        dataProvider.request(for: request) { [weak self] (result) in
        guard let self = self else { return }
        self.hideActivityIndicatorView?()
        self.isRequestEnabled = true
        self.showActivityIndicatorView?()
        switch result {
        case .success(let response):
            if self.page == 1 {
                self.cellItems.removeAll()
            }
        let cellItems = response.data.map({ FavoriteCellModel(data: $0) })
        self.cellItems.append(contentsOf: cellItems)
        self.page += 1
        self.isPagingEnabled = response.pagination.currentPage < response.pagination.lastPage
        self.reloadData?()
        case .failure(let error):
                self.showWarningToast?(error.localizedDescription)
        }
    }
}
    
    func pullToRefresh() {
        self.page = 1
        self.getFavorites()
    }
}
