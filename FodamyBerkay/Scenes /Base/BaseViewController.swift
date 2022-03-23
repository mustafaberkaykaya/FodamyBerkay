//
//  BaseViewController.swift
//  FodamyBerkay
//
//  Created by Mustafa Berkay Kaya on 11.03.2022.
//

class BaseViewController<V: BaseViewModelProtocol>: UIViewController, BaseViewController.LoadingProtocols {
    
    typealias LoadingProtocols = LoadingProtocol & ActivityIndicatorProtocol
    
    var viewModel: V
    
    init(viewModel: V) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    private func subscribeActivityIndicator() {
        viewModel.showActivityIndicatorView = { [weak self] in
            self?.showActivityIndicator()
        }
        viewModel.hideActivityIndicatorView = { [weak self] in
            self?.hideActivityIndicator()
        }
    }
    
    private func subscribeLoading() {
        viewModel.showLoading = { [weak self] in
            self?.presentLoading()
        }
        viewModel.hideLoading = { [weak self] in
            self?.dismissLoading()
        }
    }
    
    private func subscribeToast() {
        viewModel.showWarningToast = { text in
            ToastPresenter.showWarningToast(text: text)
        }
    }

    func showWarningToast(message: String) {
        ToastPresenter.showWarningToast(text: message)
    }
    
    // swiftlint:disable fatal_error unavailable_function
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // swiftlint:enable fatal_error unavailable_function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    #if DEBUG
    deinit {
        debugPrint("deinit \(self)")
    }
    #endif
    
}
