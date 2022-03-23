//
//  FavoritesCellModel + Extension.swift
//  UIComponents
//
//  Created by Mustafa Berkay Kaya on 23.03.2022.
//

extension FavoriteCellModel {
    public convenience init(data: RecipeCategoriesData) {
        let cellItems = data.recipes.map({ FavoriteInRecipeCellModel(recipe: $0) })
        guard let url = data.categoryImage?.url else {
            self.init(categoryId: data.id, imageURL: nil, categoryName: data.name, cellItems: cellItems)
                return
            }
        self.init(categoryId: data.id, imageURL: url, categoryName: data.name, cellItems: cellItems)
        }
}
