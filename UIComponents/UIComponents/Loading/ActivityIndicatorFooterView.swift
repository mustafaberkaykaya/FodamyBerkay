//
//  ActivityIndicatorFooterView.swift
//  UIComponents
//
//  Created by Mustafa Berkay Kaya on 16.03.2022.
//

public class ActivityIndicatorFooterView: UICollectionReusableView, ReusableView {

    public let activityIndicator = ActivityIndicatorView(frame: .infinite)

    override init(frame: CGRect) {
        super.init(frame: frame)
        addActivityIndicator()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addActivityIndicator()
    }

    private func addActivityIndicator() {
        addSubview(activityIndicator)
        activityIndicator.centerInSuperview()
    }
}
