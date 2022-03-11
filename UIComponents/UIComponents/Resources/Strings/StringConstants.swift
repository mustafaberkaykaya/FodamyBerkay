// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {

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
