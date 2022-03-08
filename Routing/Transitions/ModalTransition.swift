//
//  ModalTransition.swift
//  FodamyBerkay
//
//  Created by Mustafa Berkay Kaya on 7.03.2022.
//

import UIKit

class ModalTransition: NSObject {

    var animator: Animator?
    var isAnimated: Bool = true

    var completionHandler: (() -> Void)?

    weak var viewController: UIViewController?

    init(animator: Animator? = nil,
         isAnimated: Bool = true) {
        self.animator = animator
        self.isAnimated = isAnimated
    }
}

// MARK: - Transition

extension ModalTransition: Transition {
    func close(_ viewController: UIViewController) {
        viewController.dismiss(animated: isAnimated, completion: completionHandler)
    }
    
    func open(_ viewController: UIViewController) {
        viewController.transitioningDelegate = self

        self.viewController?.present(viewController, animated: isAnimated, completion: completionHandler)
    }

}

// MARK: - UIViewControllerTransitioningDelegate

extension ModalTransition: UIViewControllerTransitioningDelegate {

    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let animator = animator else {
            return nil
        }
        animator.isPresenting = true
        return animator
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let animator = animator else {
            return nil
        }
        animator.isPresenting = false
        return animator
    }
}

