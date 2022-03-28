//
//  RecipeDetailViewModel.swift
//  FodamyBerkay
//
//  Created by Mustafa Berkay Kaya on 24.03.2022.
//

import Foundation
import KeychainSwift

protocol RecipeDetailViewDataSource {
    var username: String? { get }
    var userId: Int? { get }
    var userImageUrl: String? { get }
    var userFollowedCount: Int? { get }
    var recipeName: String? { get }
    var recipeCount: Int? { get }
    var categoryName: String? { get }
    var timeDifferenceText: String? { get }
    var recipeAndFollowerCountText: String? { get }
    var ingredients: String? { get }
    var numberOfPeople: String? { get }
    var steps: String? { get }
    var time: String? { get }
    var commentCount: Int? { get }
    var likeCount: Int? { get }
    var isLiked: Bool { get }
    var isFollowing: Bool { get }
    
    func numberOfItemsAt(section: Int) -> Int
    func cellItemAt(indexPath: IndexPath) -> RecipeDetailCommentCellProtocol
}

protocol RecipeDetailViewEventSource {
}

protocol RecipeDetailViewProtocol: RecipeDetailViewDataSource, RecipeDetailViewEventSource {
    func getRecipeDetail()
    func getRecipeDetailComments()
    func likeButtonTapped()
}

final class RecipeDetailViewModel: BaseViewModel<RecipeDetailRouter>, RecipeDetailViewProtocol {
    var username: String?
    var userId: Int?
    var userImageUrl: String?
    var recipeName: String?
    var recipeCount: Int?
    var categoryName: String?
    var timeDifferenceText: String?
    var recipeAndFollowerCountText: String?
    var ingredients: String?
    var numberOfPeople: String?
    var steps: String?
    var time: String?
    var commentCount: Int?
    var likeCount: Int?
    var isLiked = false
    var isFollowing = false
    private let recipeId: Int
    private var followedId: Int?
    var reloadCommentData: VoidClosure?
    var reloadDetailData: VoidClosure?
    var toggleIsLiked: VoidClosure?
    var toggleIsFollowing: VoidClosure?
    
    var userFollowedCount: Int? {
        didSet {
            recipeAndFollowerCountText = "\(recipeCount ?? 0) \(L10n.RecipeDetail.recipe) \(userFollowedCount ?? 0) \(L10n.RecipeDetail.followers)"
        }
    }
    
    let keychain = KeychainSwift()
    var recipeHeaderCellItems: [RecipeDetailHeaderCellProtocol] = []
    
    init(recipeId: Int, router: RecipeDetailRouter) {
        self.recipeId = recipeId
        super.init(router: router)
    }
    
    func numberOfItemsAt(section: Int) -> Int {
        return cellItems.count
    }
    
    func cellItemAt(indexPath: IndexPath) -> RecipeDetailCommentCellProtocol {
        return cellItems[indexPath.row]
    }
    
    var cellItems: [RecipeDetailCommentCellProtocol] = []
}
// MARK: - Actions
extension RecipeDetailViewModel {
    func likeButtonTapped() {
        guard keychain.get(Keychain.token) != nil else {
            router.pushLoginReminder(loginHandler: { [weak self] in
                self?.router.presentLogin()
            })
            return
        }
        print("beğenme isteği yollanıyor")
    }
}

// MARK: - Network
extension RecipeDetailViewModel {
    func getRecipeDetailComments() {
        let request = GetRecipeCommentsRequest(recipeId: recipeId)
        dataProvider.request(for: request) { [weak self] result in
            switch result {
            case .success(let response):
                guard let self = self else { return }
                let cellItems = response.data.map({ RecipeDetailCommentCellModel(comment: $0) })
                self.cellItems = cellItems
                self.reloadCommentData?()
            case .failure:
                self?.reloadCommentData?()
            }
        }
    }
    
    func getRecipeDetail() {
        dataProvider.request(for: GetRecipeDetailRequest(recipeId: recipeId)) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let recipeDetail):
                self.setData(recipeDetail: recipeDetail)
                self.reloadDetailData?()
            case .failure(let error ):
                print(error.localizedDescription)
            }
        }
    }
    
    private func setData(recipeDetail: RecipeDetail) {
        username = recipeDetail.user.username
        userId = recipeDetail.user.id
        userImageUrl = recipeDetail.user.image?.url
        userFollowedCount = recipeDetail.user.followedCount
        recipeName = recipeDetail.title
        recipeCount = recipeDetail.user.recipeCount
        categoryName = recipeDetail.category.name
        timeDifferenceText = recipeDetail.timeDifference
        recipeAndFollowerCountText = "\(recipeCount ?? 0) \(L10n.RecipeDetail.recipe) \(userFollowedCount ?? 0) \(L10n.RecipeDetail.followers)"
        ingredients = recipeDetail.ingredients
        numberOfPeople = recipeDetail.numberOfPerson.text
        steps = recipeDetail.instructions
        time = recipeDetail.timeOfRecipe.text
        commentCount = recipeDetail.commentCount
        likeCount = recipeDetail.likeCount
        isLiked = recipeDetail.isLiked
        isFollowing = recipeDetail.user.isFollowing
        followedId = recipeDetail.user.id
        recipeDetail.images.forEach({ image in
            recipeHeaderCellItems.append(RecipeDetailHeaderCellModel(imageUrl: image.url ?? "", isEditorChoice: recipeDetail.isEditorChoice))
        })
    }
}
