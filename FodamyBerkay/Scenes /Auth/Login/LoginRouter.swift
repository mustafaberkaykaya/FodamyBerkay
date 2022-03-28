//
//  LoginRouter.swift
//  FodamyBerkay
//
//  Created by Mustafa Berkay Kaya on 28.03.2022.
//

final class LoginRouter: Router, LoginRouter.Routes {
    typealias Routes = SignUpRoute & ForgotPasswordRoute
}
