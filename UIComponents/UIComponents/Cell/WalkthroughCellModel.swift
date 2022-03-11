//
//  WalkthroughCellModel.swift
//  UIComponents
//
//  Created by Mustafa Berkay Kaya on 11.03.2022.
//

import Foundation

public protocol WalkthroughCellDataSource: AnyObject {
    
}

public protocol WalkthroughCellEventSource: AnyObject {
    
}

public protocol WalkthroughCellProtocol: WalkthroughCellDataSource, WalkthroughCellEventSource {
    
}

public final class WalkthroughCellModel: WalkthroughCellProtocol {
    
}
