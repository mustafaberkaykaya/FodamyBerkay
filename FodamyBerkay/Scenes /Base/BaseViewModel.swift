//
//  BaseViewModel.swift
//  FodamyBerkay
//
//  Created by Mustafa Berkay Kaya on 11.03.2022.
//

protocol BaseViewModelDataSource: AnyObject {}

protocol BaseViewModelEventSource: AnyObject {}

protocol BaseViewModelProtocol: BaseViewModelDataSource, BaseViewModelEventSource {}

class BaseViewModel<R: Router>: BaseViewModelProtocol {
    
    let router: R
    
    init(router: R) {
        self.router = router
    }
    
    #if DEBUG
    deinit {
        debugPrint("deinit \(self)")
    }
    #endif
}
