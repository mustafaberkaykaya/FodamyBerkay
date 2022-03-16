//
//  HomeViewController.swift
//  FodamyBerkay
//
//  Created by Mustafa Berkay Kaya on 13.03.2022.
//

import UIKit
import Segmentio

final class HomeViewController: BaseViewController<HomeViewModel> {
    private let imageView = UIImageViewBuilder().build()
    private lazy var customSegmentView: Segmentio = {
        let customSegmentView = Segmentio()
        customSegmentView.setup(content: [SegmentioItem(title: viewModel.segmentedControlType[0],
                                                        image: nil),
                                          SegmentioItem(title: viewModel.segmentedControlType[1],
                                                        image: nil)],
                                style: .onlyLabel, options: .options())
        return customSegmentView
    }()
    private let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    private lazy var subViewControllers: [UIViewController] = {
        return self.allViewControllers()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        setSegmentHandler()
        configureContents()
    }
}
// MARK: - UILayout
extension HomeViewController {
    private func addSubViews() {
        addNavigationBarLogo()
        addSegmentView()
        addPageViewController()
        addTabBarItem()
    }
   
    private func addNavigationBarLogo() {
        imageView.image = UIImage.imgLogoFodamy
        navigationItem.titleView = imageView
        imageView.contentMode = .scaleAspectFit
        imageView.width(110)
        imageView.height(30)
    }
    
    private func addSegmentView() {
        view.addSubview(pageViewController.view)
        view.addSubview(customSegmentView)
        customSegmentView.topToSuperview(usingSafeArea: true)
        customSegmentView.leadingToSuperview()
        customSegmentView.trailingToSuperview()
        customSegmentView.height(46)
    }
    
    private func addPageViewController() {
        addChild(pageViewController)
        pageViewController.didMove(toParent: self)
        pageViewController.view.topToBottom(of: customSegmentView)
        pageViewController.view.leadingToSuperview()
        pageViewController.view.trailingToSuperview()
    }
    
    private func addTabBarItem() {
        navigationController?.tabBarItem.image = .icHome
        let rightBarItem = UIBarButtonItem(
            image: .icLogout.withAlignmentRectInsets(.init(top: 0, left: 0, bottom: -2, right: 0)),
            style: .done,
            target: nil,
            action: nil)
        navigationItem.setRightBarButton(rightBarItem, animated: true)
    }
}
// MARK: - ConfigureContents
extension HomeViewController {
    private func configureContents() {
        customSegmentView.selectedSegmentioIndex = viewModel.selectedSegmentControlIndex
        pageViewController.delegate = self
        pageViewController.dataSource = self
    }
}

// MARK: - Helper
extension HomeViewController {
    private func allViewControllers() -> [UIViewController] {
        let editorChoiceRouter = RecipesRouter()
        let editorChoiceViewModel = RecipesViewModel(recipesType: .editorChoice, router: editorChoiceRouter)
        let editorChoiceviewController = RecipesViewController(viewModel: editorChoiceViewModel)
         editorChoiceRouter.viewController = editorChoiceviewController
         
        let lastAddedRouter = RecipesRouter()
        let lastAddedRecipesViewModel = RecipesViewModel(recipesType: .lastAdded, router: lastAddedRouter)
        let lastAddedRecipesviewController = RecipesViewController(viewModel: lastAddedRecipesViewModel)
         lastAddedRouter.viewController = lastAddedRecipesviewController
         
         return [
             editorChoiceviewController,
             lastAddedRecipesviewController
         ]
    }
    
    private func setSegmentHandler() {
        customSegmentView.valueDidChange = { [weak self] _, segmentIndex in
            guard let self = self else { return }
            var direction: UIPageViewController.NavigationDirection = .forward
        if segmentIndex < self.viewModel.selectedSegmentControlIndex {
            direction = .reverse
        }
        self.pageViewController.setViewControllers([self.subViewControllers[segmentIndex]],
                                                   direction: direction,
                                                   animated: true,
                                                   completion: nil)
        self.viewModel.selectedSegmentControlIndex = segmentIndex
            }
        }
    }

// MARK: - Delegates
extension HomeViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return subViewControllers.count
    }
        
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            let currentIndex = subViewControllers.firstIndex(of: viewController) ?? 0
            if currentIndex <= 0 {
                return nil
            }
        return subViewControllers[currentIndex - 1]
    }
        
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            let currentIndex = subViewControllers.firstIndex(of: viewController) ?? 0
            if currentIndex >= subViewControllers.count - 1 {
                return nil
    }
        return subViewControllers[currentIndex + 1]
    }
        
    func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        if completed {
            if let currentViewController = pageViewController.viewControllers?.first,
                let index = subViewControllers.firstIndex(of: currentViewController) {
                    customSegmentView.selectedSegmentioIndex = index
            }
        }
    }
}
