//
//  WalkthroughCellModel.swift
//  UIComponents
//
//  Created by Mustafa Berkay Kaya on 11.03.2022.
//

import Foundation

public protocol WalkthroughCellDataSource: AnyObject {
    var image: UIImage { get }
    var titleText: String { get }
    var descriptionText: String { get }
}

public protocol WalkthroughCellEventSource: AnyObject {
    
}

public protocol WalkthroughCellProtocol: WalkthroughCellDataSource, WalkthroughCellEventSource {
    
}

public final class WalkthroughCellModel: WalkthroughCellProtocol {
    public var image: UIImage
    public var titleText: String
    public var descriptionText: String
    
    public init(image: UIImage, titleText: String, descriptionText: String) {
        self.image = image
        self.titleText = titleText
        self.descriptionText = descriptionText
    }
    
  
    
    
}
