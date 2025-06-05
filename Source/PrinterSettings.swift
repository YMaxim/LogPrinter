//
//  PrinterSettings.swift
//  LogPrinter
//
//  Created by Maksym Yevtukhivskyi on 05.06.2025.
//

import Foundation

/// A structure that defines configuration options for customizing log output.
public struct PrinterSettings: Sendable {
    /// Indicates whether the log should display the category in which it was generated.
    public var isShowCategory: Bool
    
    /// Indicates whether the log should display the log level (e.g., debug, warning, error).
    public var isShowLevel: Bool
    
    /// Indicates whether the log should display the date and time when it was generated.
    public var isShowDate: Bool
    
    /// Indicates whether the log should display the name of the thread in which it was generated.
    public var isShowThreadName: Bool
    
    /// Indicates whether the log should display the filename where it was generated.
    public var isShowFileName: Bool
    
    /// Indicates whether the log should display the line number from which it was generated.
    public var isShowLineNumber: Bool
    
    /// Indicates whether the log should display the function name from which it was generated.
    public var isShowFunctionName: Bool
    
    /// A list of categories that are enabled for printing to the console.
    public var enabledCategories: [PrinterCategory]
    
    /// A list of categories that are explicitly disabled for printing. This takes precedence over `enabledCategories`.
    public var disabledCategories: [PrinterCategory]
    
    /// The formatter used to format timestamps in log messages.
    public var dateFormatter: DateFormatter
    
    /// Initializes a new `PrinterSettings` instance with the provided configuration options.
    ///
    /// - Parameters:
    ///   - isShowCategory: Whether to show the log category. Default is `true`.
    ///   - isShowLevel: Whether to show the log level. Default is `false`.
    ///   - isShowDate: Whether to show the timestamp of the log. Default is `false`.
    ///   - isShowThreadName: Whether to show the thread name. Default is `true`.
    ///   - isShowFileName: Whether to show the file name. Default is `true`.
    ///   - isShowLineNumber: Whether to show the line number. Default is `true`.
    ///   - isShowFunctionName: Whether to show the function name. Default is `true`.
    ///   - enabledCategories: The categories to allow logging for. Default is `PrinterCategory.allCases`.
    ///   - disabledCategories: The categories to block from logging. Default is an empty list.
    ///   - dateFormatter: A custom `DateFormatter`. If `nil`, a default formatter is used.
    public init(isShowCategory: Bool = true,
                isShowLevel: Bool = false,
                isShowDate: Bool = false,
                isShowThreadName: Bool = true,
                isShowFileName: Bool = true,
                isShowLineNumber: Bool = true,
                isShowFunctionName: Bool = true,
                enabledCategories: [PrinterCategory] = PrinterCategory.allCases,
                disabledCategories: [PrinterCategory] = [],
                dateFormatter: DateFormatter? = nil) {
        self.isShowCategory = isShowCategory
        self.isShowLevel = isShowLevel
        self.isShowDate = isShowDate
        self.isShowThreadName = isShowThreadName
        self.isShowFileName = isShowFileName
        self.isShowLineNumber = isShowLineNumber
        self.isShowFunctionName = isShowFunctionName
        self.enabledCategories = enabledCategories
        self.disabledCategories = disabledCategories
        
        if let dateFormatter {
            self.dateFormatter = dateFormatter
        } else {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
            self.dateFormatter = formatter
        }
    }
}
