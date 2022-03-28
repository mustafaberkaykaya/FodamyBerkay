//
//  UnfollowAlertRoute.swift
//  FodamyBerkay
//
//  Created by Mustafa Berkay Kaya on 28.03.2022.
//

import UIKit

protocol UnfollowAlertRoute {
    func presentUnfollowAlertView(unFollowAction: VoidClosure?)
}

extension UnfollowAlertRoute where Self: RouterProtocol {
    func presentUnfollowAlertView(unFollowAction: VoidClosure?) {
        let transition = ModalTransition()
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let unFollowAction = UIAlertAction(title: L10n.UnfollowAlert.unf, style: .destructive) {_ in
            unFollowAction?()
        }
        let cancelAction = UIAlertAction(title: L10n.UnfollowAlert.cancel, style: .cancel, handler: nil)
        
        alert.addAction(unFollowAction)
        alert.addAction(cancelAction)
        
        open(alert, transition: transition)
    }
}
