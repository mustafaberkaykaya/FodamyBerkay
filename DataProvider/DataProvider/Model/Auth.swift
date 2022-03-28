//
//  Auth.swift
//  DataProvider
//
//  Created by Mustafa Berkay Kaya on 28.03.2022.
//

public struct Auth: Decodable {
    public let token: String
    public let user: User
}
