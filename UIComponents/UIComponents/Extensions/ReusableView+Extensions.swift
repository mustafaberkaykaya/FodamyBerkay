//
//  ReusableView+Extensions.swift
//  UIComponents
//
//  Created by Mustafa Berkay Kaya on 11.03.2022.
//

public extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}
