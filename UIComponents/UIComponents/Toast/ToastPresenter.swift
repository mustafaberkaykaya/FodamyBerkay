//
//  ToastPresenter.swift
//  UIComponents
//
//  Created by Mustafa Berkay Kaya on 16.03.2022.
//

import SwiftEntryKit

public class ToastPresenter {

    public static func showWarningToast(text: String) {
        var attributes = EKAttributes.topToast
        attributes.entryBackground = .color(color: EKColor(light: .appRed, dark: .appRed))
        attributes.entranceAnimation = .translation
        attributes.exitAnimation = .translation

        let customView = TostWarningView(text: text)
        SwiftEntryKit.display(entry: customView, using: attributes)
    }
}
