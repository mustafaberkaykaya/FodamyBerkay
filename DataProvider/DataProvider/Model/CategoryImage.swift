//
//  CategoryImage.swift
//  DataProvider
//
//  Created by Mustafa Berkay Kaya on 23.03.2022.
//

public struct CategoryImage: Decodable {
    public let url: String?

    enum CodingKeys: String, CodingKey {
        case url
    }
}
