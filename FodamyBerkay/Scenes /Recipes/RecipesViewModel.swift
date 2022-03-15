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

protocol RecipesViewEventSource {}

protocol RecipesViewProtocol: RecipesViewDataSource, RecipesViewEventSource {}

final class RecipesViewModel: BaseViewModel<RecipesRouter>, RecipesViewProtocol {
    
    enum RecipesType {
        case editorChoice
        case lastAdded
        case categoryRecipes(categoryId: Int)
    }
    
    var cellItems: [RecipeCellProtocol] = []
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
