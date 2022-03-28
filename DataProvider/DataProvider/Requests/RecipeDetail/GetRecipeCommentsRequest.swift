//
//  GetRecipeCommentsRequest.swift
//  DataProvider
//
//  Created by Mustafa Berkay Kaya on 25.03.2022.
//

public struct GetRecipeCommentsRequest: ApiDecodableResponseRequest {
    
    public typealias ResponseType = BaseResponse<[RecipeComment]>
    
    public var path: String = "recipe/{recipeId}/comment"
    public var method: RequestMethod = .get
    public var parameters: RequestParameters = [:]
    
    public init(recipeId: Int, page: Int? = 1) {
        self.path = "recipe/\(recipeId)/comment"
        self.parameters["page"] = page
    }
    
}
