//
//  WalkthroughRoute.swift
//  FodamyBerkay
//
//  Created by Mustafa Berkay Kaya on 8.03.2022.
//

protocol WalkthroughRoute {
    func placeOnWindowWalkThrough()
}

extension WalkthroughRoute where Self: RouterProtocol {
    
    func placeOnWindowWalkThrough() {
        let router = WalkthroughRouter()
        let viewModel = WalkthroughViewModel(router: router)
        let viewController = WalkthroughViewController(viewModel: viewModel)
        
        let transition = PlaceOnWindowTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
