//
//  ForgotPasswordRequest.swift
//  DataProvider
//
//  Created by Mustafa Berkay Kaya on 28.03.2022.
//

public struct ForgotPasswordRequest: ApiDecodableResponseRequest {
    public typealias ResponseType = Auth

    public let path: String = "auth/forgot"
    public let method: RequestMethod = .post
    public var parameters: RequestParameters = [:]
    
    public init(email: String) {
        parameters["email"] = email
    }
}
