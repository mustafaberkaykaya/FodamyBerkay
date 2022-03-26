//
//  RecipeDetailRoute.swift
//  FodamyBerkay
//
//  Created by Mustafa Berkay Kaya on 24.03.2022.
//

protocol RecipeDetailRoute {
    func pushRecipeDetail(recipeId: Int)
}

extension RecipeDetailRoute where Self: RouterProtocol {
    
    func pushRecipeDetail(recipeId: Int) {
        let router = RecipeDetailRouter()
        let viewModel = RecipeDetailViewModel(recipeId: recipeId, router: router)
        let viewController = RecipeDetailViewController(viewModel: viewModel)
        
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
