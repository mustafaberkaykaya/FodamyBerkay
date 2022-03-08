//
//  WalkthroughViewModel.swift
//  FodamyBerkay
//
//  Created by Mustafa Berkay Kaya on 7.03.2022.
//

import Foundation

protocol WalkthroughViewDataSource {}

protocol WalkthroughViewEventSource {}

protocol WalkthroughViewProtocol: WalkthroughViewDataSource, WalkthroughViewEventSource {}

final class WalkthroughViewModel: BaseViewModel<WalkthroughRouter>, WalkthroughViewProtocol {
    
}
