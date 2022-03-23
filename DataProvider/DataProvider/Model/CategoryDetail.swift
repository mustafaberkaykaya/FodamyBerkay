//
//  CategoryDetail.swift
//  DataProvider
//
//  Created by Mustafa Berkay Kaya on 16.03.2022.
//

public struct CategoryDetail: Decodable {
    public let id: Int
    public let name: String?
    public let mainCategoryId: Int?
    public let imageUrl: Image?

    enum CodingKeys: String, CodingKey {
        case id, name
        case mainCategoryId = "main_category_id"
        case imageUrl = "image"
    }
}
