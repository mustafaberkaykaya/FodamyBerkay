//
//  EmptyCellModel.swift
//  UIComponents
//
//  Created by Mustafa Berkay Kaya on 25.03.2022.
//

import Foundation

public protocol EmptyCellDataSource: AnyObject {
    
}

public protocol EmptyCellEventSource: AnyObject {
    
}

public protocol EmptyCellProtocol: EmptyCellDataSource, EmptyCellEventSource {
    
}

public final class EmptyCellModel: EmptyCellProtocol {
    
}
