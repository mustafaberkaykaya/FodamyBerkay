//
//  ReusableView.swift
//  UIComponents
//
//  Created by Mustafa Berkay Kaya on 11.03.2022.
//

public protocol ReusableView: AnyObject {
  static var defaultReuseIdentifier: String { get }
}


