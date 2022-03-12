//
//  Transition.swift
//  FodamyBerkay
//
//  Created by Mustafa Berkay Kaya on 7.03.2022.
//

import UIKit

protocol Transition: AnyObject {
    var viewController: UIViewController? { get set }

    func open(_ viewController: UIViewController)
    func close(_ viewController: UIViewController)
}
