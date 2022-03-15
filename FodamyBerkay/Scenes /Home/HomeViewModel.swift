//
//  HomeViewModel.swift
//  FodamyBerkay
//
//  Created by Mustafa Berkay Kaya on 13.03.2022.
//

import Foundation

protocol HomeViewDataSource {
    var segmentedControlType: [String] { get }
    var selectedSegmentControlIndex: Int { get }
}

protocol HomeViewEventSource {}

protocol HomeViewProtocol: HomeViewDataSource, HomeViewEventSource {}

final class HomeViewModel: BaseViewModel<HomeRouter>, HomeViewProtocol {
    var segmentedControlType: [String] = [L10n.Home.segmentControlType1,
                                          L10n.Home.segmentControlType2]
    var selectedSegmentControlIndex = 0
    
}
