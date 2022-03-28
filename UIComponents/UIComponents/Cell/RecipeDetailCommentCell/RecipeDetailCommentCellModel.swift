//
//  RecipeDetailCommentCellModel.swift
//  UIComponents
//
//  Created by Mustafa Berkay Kaya on 25.03.2022.
//

import Foundation

public protocol RecipeDetailCommentCellDataSource: AnyObject {
    var userId: Int { get }
    var imageUrl: String? { get }
    var username: String? { get }
    var recipeAndFollowerCountText: String? { get }
    var timeDifferenceText: String? { get }
    var commentId: Int { get }
    var commentText: String? { get set }
    var isOwner: Bool { get set }
}

public protocol RecipeDetailCommentCellEventSource: AnyObject {
    var moreButtonTapped: VoidClosure? { get set }
    var commentTextDidChanged: VoidClosure? { get set }
}

public protocol RecipeDetailCommentCellProtocol: RecipeDetailCommentCellDataSource, RecipeDetailCommentCellEventSource {
    
}

public final class RecipeDetailCommentCellModel: RecipeDetailCommentCellProtocol {
    public var userId: Int
    public var imageUrl: String?
    public var username: String?
    public var recipeAndFollowerCountText: String?
    public var timeDifferenceText: String?
    public var commentId: Int
    public var commentText: String?
    public var isOwner: Bool
    public var moreButtonTapped: VoidClosure?
    public var commentTextDidChanged: VoidClosure?

    public init(userId: Int,
                imageUrl: String?,
                username: String?,
                recipeAndFollowerCountText: String?,
                timeDifferenceText: String?,
                commentId: Int,
                commentText: String?,
                isOwner: Bool) {
        self.userId = userId
        self.imageUrl = imageUrl
        self.username = username
        self.recipeAndFollowerCountText = recipeAndFollowerCountText
        self.timeDifferenceText = timeDifferenceText
        self.commentId = commentId
        self.commentText = commentText
        self.isOwner = isOwner
    }}
