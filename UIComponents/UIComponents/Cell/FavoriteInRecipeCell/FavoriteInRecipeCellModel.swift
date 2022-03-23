//
//  FavoriteInRecipeCellModel.swift
//  UIComponents
//
//  Created by Mustafa Berkay Kaya on 23.03.2022.
//

import Foundation

public protocol FavoriteInRecipeCellDataSource: AnyObject {
    var profileImageURL: String? { get }
    var username: String? { get }
    var recipeImageURL: String? { get }
    var recipeTitle: String? { get }
    var recipeInfo: String? { get }
    var isEditorChoice: Bool? { get }
}

public protocol FavoriteInRecipeCellEventSource: AnyObject {
    
}

public protocol FavoriteInRecipeCellProtocol: FavoriteInRecipeCellDataSource, FavoriteInRecipeCellEventSource {
    
}

public final class FavoriteInRecipeCellModel: FavoriteInRecipeCellProtocol {
    public var profileImageURL: String?
    public var username: String?
    public var recipeImageURL: String?
    public var recipeTitle: String?
    public var recipeInfo: String?
    public var isEditorChoice: Bool?
    
    public init(profileImageURL: String?,
                username: String?,
                recipeImageURL: String?,
                recipeTitle: String?,
                recipeInfo: String?,
                isEditorChoice: Bool?) {
        self.profileImageURL = profileImageURL
        self.username = username
        self.recipeImageURL = recipeImageURL
        self.recipeTitle = recipeTitle
        self.recipeInfo = recipeInfo
        self.isEditorChoice = isEditorChoice
    }
    
    public convenience init(recipe: Recipe) {
        self.init(profileImageURL: recipe.user.image?.url,
                  username: recipe.user.username,
                  recipeImageURL: recipe.images.first?.url,
                  recipeTitle: recipe.title,
                  recipeInfo: "\(recipe.commentCount) Yorum \(recipe.likeCount) Beğeni",
                  isEditorChoice: recipe.isEditorChoice)
    }
}
