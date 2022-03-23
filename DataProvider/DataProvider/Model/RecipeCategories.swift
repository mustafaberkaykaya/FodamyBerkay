//
//  RecipeCategories.swift
//  DataProvider
//
//  Created by Mustafa Berkay Kaya on 23.03.2022.
//

public struct RecipeCategories: Decodable {
    public let data: [RecipeCategoriesData]
    public let pagination: Pagination

    enum CodingKeys: String, CodingKey {
        case data
        case pagination
    }
}
