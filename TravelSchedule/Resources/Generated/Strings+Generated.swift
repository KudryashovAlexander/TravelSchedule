// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L {
  public enum Carriers {
    /// Уточнить время
    public static let checkTime = L.tr("Localizable", "carriers.checkTime", fallback: "Уточнить время")
    /// Email
    public static let email = L.tr("Localizable", "carriers.email", fallback: "Email")
    /// Информация о перевозчике
    public static let information = L.tr("Localizable", "carriers.information", fallback: "Информация о перевозчике")
    /// Вариантов нет
    public static let notFound = L.tr("Localizable", "carriers.notFound", fallback: "Вариантов нет")
    /// Телефон
    public static let phone = L.tr("Localizable", "carriers.phone", fallback: "Телефон")
  }
  public enum CheckCity {
    /// Введите запрос
    public static let addRequest = L.tr("Localizable", "checkCity.addRequest", fallback: "Введите запрос")
    /// Выбор города
    public static let city = L.tr("Localizable", "checkCity.city", fallback: "Выбор города")
    /// Город не найден
    public static let notFound = L.tr("Localizable", "checkCity.notFound", fallback: "Город не найден")
  }
  public enum CheckStation {
    /// Введите запрос
    public static let addRequest = L.tr("Localizable", "checkStation.addRequest", fallback: "Введите запрос")
    /// Станция не найдена
    public static let notFound = L.tr("Localizable", "checkStation.notFound", fallback: "Станция не найдена")
    /// Выбор станции
    public static let station = L.tr("Localizable", "checkStation.station", fallback: "Выбор станции")
  }
  public enum Filter {
    /// Применить
    public static let apply = L.tr("Localizable", "filter.apply", fallback: "Применить")
    /// День 12:00 - 18:00
    public static let dayTime = L.tr("Localizable", "filter.dayTime", fallback: "День 12:00 - 18:00")
    /// Время отправления
    public static let depTime = L.tr("Localizable", "filter.depTime", fallback: "Время отправления")
    /// Вечер 18:00 - 00:00
    public static let evening = L.tr("Localizable", "filter.evening", fallback: "Вечер 18:00 - 00:00")
    /// Утро 06:00 - 12:00
    public static let morning = L.tr("Localizable", "filter.morning", fallback: "Утро 06:00 - 12:00")
    /// Ночь 00:00 - 06:00
    public static let night = L.tr("Localizable", "filter.night", fallback: "Ночь 00:00 - 06:00")
    /// Показывать варианты с пересадками
    public static let options = L.tr("Localizable", "filter.options", fallback: "Показывать варианты с пересадками")
  }
  public enum Main {
    /// Найти
    public static let find = L.tr("Localizable", "main.find", fallback: "Найти")
    /// Откуда
    public static let from = L.tr("Localizable", "main.from", fallback: "Откуда")
    /// Нет
    public static let no = L.tr("Localizable", "main.no", fallback: "Нет")
    /// Куда
    public static let to = L.tr("Localizable", "main.to", fallback: "Куда")
    /// Да
    public static let yes = L.tr("Localizable", "main.yes", fallback: "Да")
  }
  public enum NetworkError {
    /// Нет интернета
    public static let connect = L.tr("Localizable", "networkError.connect", fallback: "Нет интернета")
    /// Ошибка сервера
    public static let server = L.tr("Localizable", "networkError.server", fallback: "Ошибка сервера")
  }
  public enum Settings {
    /// Приложение использует API «Яндекс.Расписания»
    public static let apiTitle = L.tr("Localizable", "settings.apiTitle", fallback: "Приложение использует API «Яндекс.Расписания»")
    /// Версия 1.0 (beta)
    public static let apiVersion = L.tr("Localizable", "settings.apiVersion", fallback: "Версия 1.0 (beta)")
    /// Темная тема
    public static let darktheme = L.tr("Localizable", "settings.darktheme", fallback: "Темная тема")
    /// Пользовательское соглашение
    public static let politycy = L.tr("Localizable", "settings.politycy", fallback: "Пользовательское соглашение")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
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
