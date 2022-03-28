//
//  RecipesViewModel.swift
//  FodamyBerkay
//
//  Created by Mustafa Berkay Kaya on 15.03.2022.
//

import Foundation

protocol RecipesViewDataSource {
    var numberOfItems: Int { get }
    
    func cellItem(for indexPath: IndexPath) -> RecipeCellProtocol
}

protocol RecipesViewEventSource {
    var didSuccessFetchRecipes: VoidClosure? { get set }
}

protocol RecipesViewProtocol: RecipesViewDataSource, RecipesViewEventSource {
    func fetchRecipesListingType()
    func fetchMorePages()
    func didSelectRecipe(at indexPath: IndexPath)
}

final class RecipesViewModel: BaseViewModel<RecipesRouter>, RecipesViewProtocol {
        
    var cellItems: [RecipeCellProtocol] = []
    var page = 1
    var title: String?
    
    var isRequestEnabled = false
    var isPagingEnabled = false
    
    var didSuccessFetchRecipes: VoidClosure?
    
    enum RecipesType {
        case editorChoice
        case lastAdded
        case categoryRecipes(categoryId: Int)
    }
    
    private var recipesType: RecipesType
    
    init(recipesType: RecipesType, router: RecipesRouter) {
        self.recipesType = recipesType
        super.init(router: router)
    }
    
    var numberOfItems: Int {
        return cellItems.count
    }
    
    func cellItem(for indexPath: IndexPath) -> RecipeCellProtocol {
        let item = cellItems[indexPath.row]
        return item
    }
}

extension RecipesViewModel {
    func fetchRecipesListingType() {
        switch recipesType {
        case .editorChoice:
            getEditorChoice()
        case .lastAdded:
            getLastAdded()
        case .categoryRecipes(let categoryId):
            getCategory(categoryId: categoryId)
        }
    }
    
    func didSelectRecipe(at indexPath: IndexPath) {
        let recipeId = cellItems[indexPath.row].recipeId
        router.pushRecipeDetail(recipeId: recipeId)
    }
    
    private func getEditorChoice() {
        let request = GetEditorChoiceRequest(page: page)
        self.isRequestEnabled = false
        if page == 1 { showActivityIndicatorView?() }
        dataProvider.request(for: request) { [weak self] (result) in
            guard let self = self else { return }
            self.hideActivityIndicatorView?()
            self.isRequestEnabled = true
            switch result {
            case .success(let response):
                let cellItems = response.data.map({ RecipeCellModel(recipe: $0) })
                self.cellItems.append(contentsOf: cellItems)
                self.page += 1
                self.isPagingEnabled = response.pagination.currentPage < response.pagination.lastPage
                self.didSuccessFetchRecipes?()
            case .failure(let error):
                if self.page == 1 { self.showWarningToast?("\(error.localizedDescription)") }
            }
        }
    }
    
    private func getLastAdded() {
        let request = GetLastAddedRequest(page: page)
        self.isRequestEnabled = false
        if page == 1 { showActivityIndicatorView?() }
        dataProvider.request(for: request) { [weak self] (result) in
            guard let self = self else { return }
            self.hideActivityIndicatorView?()
            self.isRequestEnabled = true
            switch result {
            case .success(let response):
                let cellItems = response.data.map({ RecipeCellModel(recipe: $0) })
                self.cellItems.append(contentsOf: cellItems)
                self.page += 1
                self.isPagingEnabled = response.pagination.currentPage < response.pagination.lastPage
                self.didSuccessFetchRecipes?()
            case .failure(let error):
                if self.page == 1 { self.showWarningToast?("\(error.localizedDescription)") }
            }
        }
    }
    
    private func getCategory(categoryId: Int) {
        let request = GetCategoryRequest(page: page, categoryId: categoryId)
        self.isRequestEnabled = false
        if page == 1 { showActivityIndicatorView?() }
        dataProvider.request(for: request) { [weak self] (result) in
            guard let self = self else { return }
            self.hideActivityIndicatorView?()
            self.isRequestEnabled = true
            switch result {
            case .success(let response):
                let cellItems = response.data.map({ RecipeCellModel(recipe: $0) })
                self.cellItems.append(contentsOf: cellItems)
                self.page += 1
                self.isPagingEnabled = response.pagination.currentPage < response.pagination.lastPage
                self.didSuccessFetchRecipes?()
            case .failure(let error):
                if self.page == 1 { self.showWarningToast?("\(error.localizedDescription)") }
            }
        }
    }
  
    func fetchMorePages() {
        fetchRecipesListingType()
    }
}
