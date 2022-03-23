//
//  GetLastAddedRequest.swift
//  DataProvider
//
//  Created by Mustafa Berkay Kaya on 16.03.2022.
//

public struct GetLastAddedRequest: ApiDecodableResponseRequest {
    
    public typealias ResponseType = BaseResponse<[Recipe]>
    
    public let path: String = "recipe/"
    public let method: RequestMethod = .get
    public var parameters: RequestParameters = [:]
    public let headers: RequestHeaders = [:]
    
    public init(page: Int) {
        self.parameters["page"] = page
    }
}
