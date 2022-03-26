//
//  RecipeDetailHeaderCellModel.swift
//  UIComponents
//
//  Created by Mustafa Berkay Kaya on 24.03.2022.
//

import Foundation

public protocol RecipeDetailHeaderCellDataSource: AnyObject {
    var imageUrl: String { get }
    var isEditorChoice: Bool { get }
}

public protocol RecipeDetailHeaderCellEventSource: AnyObject {
    
}

public protocol RecipeDetailHeaderCellProtocol: RecipeDetailHeaderCellDataSource, RecipeDetailHeaderCellEventSource {
    
}

public final class RecipeDetailHeaderCellModel: RecipeDetailHeaderCellProtocol {
    public var imageUrl: String
    public var isEditorChoice: Bool
    
    public init(imageUrl: String, isEditorChoice: Bool) {
        self.imageUrl = imageUrl
        self.isEditorChoice = isEditorChoice
    }
}
