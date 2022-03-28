// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {

  public enum FavoriteCell {
    /// See All
    public static let button = L10n.tr("Localizable", "FavoriteCell.button")
  }

  public enum ForgotPassword {
    /// Forgot Password
    public static let button = L10n.tr("Localizable", "ForgotPassword.button")
    /// E-Mail
    public static let email = L10n.tr("Localizable", "ForgotPassword.email")
    /// Reset Password
    public static let title = L10n.tr("Localizable", "ForgotPassword.title")
  }

  public enum Home {
    /// Editor's Choice
    public static let segmentControlType1 = L10n.tr("Localizable", "Home.SegmentControlType1")
    /// Recently Added
    public static let segmentControlType2 = L10n.tr("Localizable", "Home.SegmentControlType2")
  }

  public enum Login {
    /// Don't have an account?
    public static let bottomLabel = L10n.tr("Localizable", "Login.bottomLabel")
    /// Login
    public static let button = L10n.tr("Localizable", "Login.button")
    /// Forgot your password?
    public static let forgot = L10n.tr("Localizable", "Login.forgot")
    /// Password
    public static let password = L10n.tr("Localizable", "Login.password")
    /// Sign Up
    public static let register = L10n.tr("Localizable", "Login.register")
    /// Login
    public static let title = L10n.tr("Localizable", "Login.title")
    /// Username
    public static let username = L10n.tr("Localizable", "Login.username")
  }

  public enum LoginPopUp {
    /// Cancel
    public static let cancel = L10n.tr("Localizable", "LoginPopUp.cancel")
    /// Login
    public static let login = L10n.tr("Localizable", "LoginPopUp.login")
    /// Login Required.
    public static let warning = L10n.tr("Localizable", "LoginPopUp.warning")
  }

  public enum RecipeDetail {
    /// Add Comment
    public static let addComment = L10n.tr("Localizable", "RecipeDetail.addComment")
    /// Comment
    public static let comment = L10n.tr("Localizable", "RecipeDetail.comment")
    /// Comments
    public static let commentsTitle = L10n.tr("Localizable", "RecipeDetail.commentsTitle")
    /// Construction
    public static let construction = L10n.tr("Localizable", "RecipeDetail.construction")
    /// Followers
    public static let followers = L10n.tr("Localizable", "RecipeDetail.followers")
    /// Like
    public static let like = L10n.tr("Localizable", "RecipeDetail.like")
    /// Materials
    public static let materials = L10n.tr("Localizable", "RecipeDetail.materials")
    /// No Comment
    public static let noComment = L10n.tr("Localizable", "RecipeDetail.noComment")
    /// Recipe
    public static let recipe = L10n.tr("Localizable", "RecipeDetail.recipe")
  }

  public enum SignUp {
    /// Do you have an account?
    public static let bottomLabel = L10n.tr("Localizable", "SignUp.bottomLabel")
    /// Sign Up
    public static let button = L10n.tr("Localizable", "SignUp.button")
    /// E-mail
    public static let email = L10n.tr("Localizable", "SignUp.email")
    /// Login
    public static let loginButton = L10n.tr("Localizable", "SignUp.loginButton")
    /// Password
    public static let password = L10n.tr("Localizable", "SignUp.password")
    /// Sign Up
    public static let title = L10n.tr("Localizable", "SignUp.title")
    /// Username
    public static let username = L10n.tr("Localizable", "SignUp.username")
  }

  public enum UserInfo {
    /// Follow
    public static let follow = L10n.tr("Localizable", "UserInfo.follow")
    /// Following
    public static let following = L10n.tr("Localizable", "UserInfo.following")
  }

  public enum UserView {
    /// Follow
    public static let follow = L10n.tr("Localizable", "UserView.follow")
    /// Following
    public static let following = L10n.tr("Localizable", "UserView.following")
  }

  public enum WalkThrough {
    /// Fodamy is the best place to find your favorite recipes in all around the word.
    public static let _1Description = L10n.tr("Localizable", "WalkThrough.1Description")
    /// Welcome to Fodamy Network!
    public static let _1Title = L10n.tr("Localizable", "WalkThrough.1Title")
    /// Fodamy is the best place to find your favorite recipes in all around the word.
    public static let _2Description = L10n.tr("Localizable", "WalkThrough.2Description")
    /// Finding recipes were not that easy.
    public static let _2Title = L10n.tr("Localizable", "WalkThrough.2Title")
    /// Fodamy is the best place to find your favorite recipes in all around the word.
    public static let _3Description = L10n.tr("Localizable", "WalkThrough.3Description")
    /// Add new recipe.
    public static let _3Title = L10n.tr("Localizable", "WalkThrough.3Title")
    /// Fodamy is the best place to find your favorite recipes in all around the word.
    public static let _4Description = L10n.tr("Localizable", "WalkThrough.4Description")
    /// Share recipes with others.
    public static let _4Title = L10n.tr("Localizable", "WalkThrough.4Title")
    /// Next
    public static let nextButton = L10n.tr("Localizable", "WalkThrough.NextButton")
    /// Start
    public static let startButton = L10n.tr("Localizable", "WalkThrough.StartButton")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
