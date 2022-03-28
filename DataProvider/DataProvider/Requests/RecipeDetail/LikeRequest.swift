//
//  LikeRequest.swift
//  DataProvider
//
//  Created by Mustafa Berkay Kaya on 28.03.2022.
//

public struct LikeRequest: ApiDecodableResponseRequest {
    
    public typealias ResponseType = Success
    
    public var path: String = "recipe/{recipeId}/like"
    public var method: RequestMethod = .post
    public let likeType: LikeType
    
    public init(recipeId: Int, likeType: LikeType) {
        self.path = "recipe/\(recipeId)/like"
        self.likeType = likeType
        switch likeType {
        case .like:
            method = .post
        case .unlike:
            method = .delete
        }
    }
    
    public enum LikeType {
        case like
        case unlike
    }
    
}
