//
//  ReusableView+Extensions.swift
//  UIComponents
//
//  Created by Mustafa Berkay Kaya on 11.03.2022.
//

public protocol ReusableView: AnyObject {
    static var reuseIdentifier: String { get }
}

public extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
