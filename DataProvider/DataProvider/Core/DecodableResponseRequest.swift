//
//  DecodableResponseRequest.swift
//  DataProvider
//
//  Created by Mustafa Berkay Kaya on 9.03.2022.
//

public protocol DecodableResponseRequest: RequestProtocol {
    associatedtype ResponseType: Decodable
}
