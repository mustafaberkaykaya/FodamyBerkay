//
//  FavoriteCellModel.swift
//  UIComponents
//
//  Created by Mustafa Berkay Kaya on 23.03.2022.
//

import Foundation

public protocol FavoriteCellDataSource: AnyObject {
    var categoryId: Int { get }
    var headerLeftImageURL: String? { get }
    var headerCategoryName: String? { get }
    var cellItems: [FavoriteInRecipeCellProtocol] { get set }
}

public protocol FavoriteCellEventSource: AnyObject {
    var reloadData: VoidClosure? { get set }
}

public protocol FavoriteCellProtocol: FavoriteCellDataSource, FavoriteCellEventSource {
    func getCount() -> Int
}

public final class FavoriteCellModel: FavoriteCellProtocol {
    public var categoryId: Int
    public var headerLeftImageURL: String?
    public var headerCategoryName: String?
    public var reloadData: VoidClosure?

    public var cellItems: [FavoriteInRecipeCellProtocol] {
        didSet {
            self.reloadData?()
        }
    }
    
    public func getCount() -> Int {
        return self.cellItems.count
    }

    public init(categoryId: Int, imageURL: String?,
                categoryName: String?,
                cellItems: [FavoriteInRecipeCellProtocol]) {
            self.categoryId = categoryId
            self.headerLeftImageURL = imageURL
            self.headerCategoryName = categoryName
            self.cellItems = cellItems
    }
}
