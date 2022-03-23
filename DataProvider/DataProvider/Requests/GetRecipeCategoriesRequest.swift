//
//  GetRecipeCategoriesRequest.swift
//  DataProvider
//
//  Created by Mustafa Berkay Kaya on 23.03.2022.
//

public struct GetRecipeCategoriesRequest: ApiDecodableResponseRequest {

    public typealias ResponseType = RecipeCategories

    public let path: String = "category-recipes"
    public let method: RequestMethod = .get
    public var parameters: RequestParameters = [:]

    public init(page: Int) {
        parameters["page"] = page
    }
}
