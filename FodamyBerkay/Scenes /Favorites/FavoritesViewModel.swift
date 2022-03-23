//
//  FavoritesViewModel.swift
//  FodamyBerkay
//
//  Created by Mustafa Berkay Kaya on 23.03.2022.
//

import Foundation

protocol FavoritesViewDataSource {}

protocol FavoritesViewEventSource {}

protocol FavoritesViewProtocol: FavoritesViewDataSource, FavoritesViewEventSource {}

final class FavoritesViewModel: BaseViewModel<FavoritesRouter>, FavoritesViewProtocol {
    
}
