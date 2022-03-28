//
//  FollowRequest.swift
//  DataProvider
//
//  Created by Mustafa Berkay Kaya on 28.03.2022.
//

public struct FollowRequest: ApiDecodableResponseRequest {
    
    public typealias ResponseType = Success
    
    public var path: String = "user/{followedId}/following"
    public var method: RequestMethod = .post
    
    public init(followedId: Int, followType: FollowType) {
        self.path = "user/\(followedId)/following"
        switch followType {
        case .follow:
            method = .post
        case .unfollow:
            method = .delete
        }
    }
    
    public enum FollowType {
        case follow
        case unfollow
    }
    
}
