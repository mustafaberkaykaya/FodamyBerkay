//
//  RecipeCellModel.swift
//  UIComponents
//
//  Created by Mustafa Berkay Kaya on 15.03.2022.
//

import Foundation

public protocol RecipeCellDataSource: AnyObject {
    var recipeId: Int { get }
    var userId: Int { get }
    var userImageUrl: String? { get }
    var username: String? { get }
    var userRecipeAndFollowerCountText: String? { get }
    var recipeTitle: String? { get }
    var categoryName: String? { get }
    var recipeImageUrl: String? { get }
    var recipeCommnetAndLikeCountText: String? { get }
    var isEditorChoice: Bool { get }
}

public protocol RecipeCellEventSource: AnyObject {
    var followButtonTapped: VoidClosure? { get set }
}

public protocol RecipeCellProtocol: RecipeCellDataSource, RecipeCellEventSource {
    
}

public final class RecipeCellModel: RecipeCellProtocol {
    public var recipeId: Int
    public var userId: Int
    public var userImageUrl: String?
    public var username: String?
    public var userRecipeAndFollowerCountText: String?
    public var recipeTitle: String?
    public var categoryName: String?
    public var recipeImageUrl: String?
    public var recipeCommnetAndLikeCountText: String?
    public var isEditorChoice = false
    public var followButtonTapped: VoidClosure?

    public init(recipeId: Int,
                userId: Int,
                userImageUrl: String?,
                username: String?,
                userRecipeAndFollowerCountText: String?,
                recipeTitle: String?,
                categoryName: String?,
                recipeImageUrl: String?,
                recipeCommnetAndLikeCountText: String?,
                isEditorChoice: Bool) {
            self.recipeId = recipeId
            self.userId = userId
            self.userImageUrl = userImageUrl
            self.username = username
            self.userRecipeAndFollowerCountText = userRecipeAndFollowerCountText
            self.recipeTitle = recipeTitle
            self.categoryName = categoryName
            self.recipeImageUrl = recipeImageUrl
            self.recipeCommnetAndLikeCountText = recipeCommnetAndLikeCountText
            self.isEditorChoice = isEditorChoice
        }
}
