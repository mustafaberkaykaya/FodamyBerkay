//
//  GetRecipeDetailRequest.swift
//  DataProvider
//
//  Created by Mustafa Berkay Kaya on 25.03.2022.
//

public struct GetRecipeDetailRequest: ApiDecodableResponseRequest {
    
    public typealias ResponseType = RecipeDetail
    
    public var path: String = "recipe/{recipeId}"
    public var method: RequestMethod = .get
    
    public init(recipeId: Int) {
        self.path = "recipe/\(recipeId)"
    }
}
