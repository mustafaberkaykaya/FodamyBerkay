//
//  RecipeCellModel + Extensions.swift
//  UIComponents
//
//  Created by Mustafa Berkay Kaya on 17.03.2022.
//

extension RecipeCellModel {
   public convenience init(recipe: Recipe) {
        self.init(recipeId: recipe.id,
                  userId: recipe.user.id,
                  userImageUrl: recipe.user.image?.url,
                  username: recipe.user.username,
                  userRecipeAndFollowerCountText: "\(recipe.user.recipeCount) Tarif \(recipe.user.followingCount) Takipçi",
                  recipeTitle: recipe.title,
                  categoryName: recipe.category.name,
                  recipeImageUrl: recipe.images.first?.url,
                  recipeCommnetAndLikeCountText: "\(recipe.commentCount) Yorum \(recipe.likeCount) Beğeni",
                  isEditorChoice: recipe.isEditorChoice)
    }
}
