//
//  Animator.swift
//  FodamyBerkay
//
//  Created by Mustafa Berkay Kaya on 7.03.2022.
//

import UIKit

protocol Animator: UIViewControllerAnimatedTransitioning {
  var isPresenting: Bool { get set }
}
