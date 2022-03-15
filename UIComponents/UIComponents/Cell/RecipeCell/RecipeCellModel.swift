//
//  RecipeCellModel.swift
//  UIComponents
//
//  Created by Mustafa Berkay Kaya on 15.03.2022.
//

import Foundation

public protocol RecipeCellDataSource: AnyObject {
    
}

public protocol RecipeCellEventSource: AnyObject {
    
}

public protocol RecipeCellProtocol: RecipeCellDataSource, RecipeCellEventSource {
    
}

public final class RecipeCellModel: RecipeCellProtocol {
    
}
