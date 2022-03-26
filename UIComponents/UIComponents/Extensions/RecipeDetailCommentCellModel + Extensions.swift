//
//  RecipeDetailCommentCellModel + Extensions.swift
//  UIComponents
//
//  Created by Mustafa Berkay Kaya on 27.03.2022.
//

extension RecipeDetailCommentCellModel {
   public convenience init(comment: RecipeComment) {
        let recipeAndFollowerCountText = "\(comment.user.recipeCount) \(L10n.RecipeDetail.recipe) \(comment.user.followedCount) \(L10n.RecipeDetail.followers)"
        let isOwner = comment.user.id == DefaultsKey.userId.value
        self.init(userId: comment.user.id,
                  imageUrl: comment.user.image?.url,
                  username: comment.user.username,
                  recipeAndFollowerCountText: recipeAndFollowerCountText,
                  timeDifferenceText: comment.timeDifference,
                  commentId: comment.id,
                  commentText: comment.text,
                  isOwner: isOwner)
    }
}
