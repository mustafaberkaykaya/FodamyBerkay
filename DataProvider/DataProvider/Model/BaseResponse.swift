//
//  BaseResponse.swift
//  DataProvider
//
//  Created by Mustafa Berkay Kaya on 16.03.2022.
//

public struct BaseResponse<T: Decodable>: Decodable {
    public let data: T
    public let pagination: Pagination
}
