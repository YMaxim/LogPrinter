//
//  Printer.swift
//  LogPrinter
//
//  Created by Maksym Yevtukhivskyi on 05.06.2025.
//

import Foundation
import OSLog

/// `Printer` is a class responsible for printing log messages with various levels of severity and additional metadata.
public final class Printer: Sendable {
    // MARK: - Properties
    /// Used for printing log messages.
    private let logger: Logger
    
    /// Used for configuring log printing behavior.
    private let settings: PrinterSettings
    
    /// The string that identifies the subsystem that emits signposts.
    /// Typically, you use the same value as your app’s bundle ID. For more information, see CFBundleIdentifier.
    private static let subsystem = Bundle.main.bundleIdentifier ?? "UnknownBundleId"
    
    /// The string that the system uses to categorize emitted signposts.
    private static let systemCategory = Bundle.main.displayName ?? "UnknownBundleName"
    
    /// Returns a formatted string describing the current thread or queue for logging purposes.
    ///
    /// - If the current thread is the main thread, it returns "[main]".
    /// - Otherwise, it attempts to retrieve the current thread's name and returns it if available.
    /// - If the thread name is unavailable or empty, it attempts to get the current dispatch queue label.
    /// - If neither the thread name nor queue label is available, it returns the thread’s memory address as a fallback.
    ///
    /// This information is useful for debugging multithreaded code by identifying which thread or queue
    /// is executing the logged code.
    private var threadDescription: String {
        if Thread.isMainThread {
            return "[main]"
        }
        
        if let threadName = Thread.current.name, !threadName.isEmpty {
            return "[\(threadName)]"
        }
        
        if let queueName = DispatchQueue.currentQueueLabel, !queueName.isEmpty {
            return "[\(queueName)]"
        }
        
        return String(format: "[%p]", Thread.current)
    }
    
    // MARK: - Initialization
    /// Designated initializer.
    public init(logger: Logger,
                settings: PrinterSettings) {
        self.logger = logger
        self.settings = settings
    }
    
    /// Convenience initializer using default logger.
    public convenience init(settings: PrinterSettings) {
        let logger = Logger(subsystem: Self.subsystem,
                            category: Self.systemCategory)
        self.init(logger: logger,
                  settings: settings)
    }
    
    /// Convenience initializer using default settings and logger.
    public convenience init() {
        self.init(settings: PrinterSettings())
    }
}

// MARK: - Log messages
extension Printer {
    /// Prints an debug log message with the specified content and metadata.
    /// - Parameters:
    ///   - message: The content of the log message.
    ///   - category: The category of the log message.
    ///   - fileName: The name of the source file where the log message originated.
    ///   - lineNumber: The line number within the source file where the log message originated.
    ///   - functionName: The name of the function where the log message originated.
    public func debug(_ message: String = "",
                      category: PrinterCategory = .logic,
                      fileName: String = #file,
                      lineNumber: Int = #line,
                      functionName: String = #function) {
        guard isEnabled(category: category) else { return }
        
        let resultMessage = getResultMessage(level: .debug,
                                             category: category,
                                             message: message,
                                             fileName: fileName,
                                             lineNumber: lineNumber,
                                             functionName: functionName)
        logger.debug("\(resultMessage)")
    }
    
    /// Prints an warning log message with the specified content and metadata.
    ///
    ///
    /// - Parameters:
    ///    - message: The content of the log message.
    ///    - category: The category of the log message.
    ///    - fileName: The name of the source file where the log message originated.
    ///    - lineNumber: The line number within the source file where the log message originated.
    ///    - functionName: The name of the function where the log message originated.
    public func warning(_ message: String = "",
                        category: PrinterCategory = .logic,
                        fileName: String = #file,
                        lineNumber: Int = #line,
                        functionName: String = #function) {
        guard isEnabled(category: category) else { return }
        
        let resultMessage = getResultMessage(level: .warning,
                                             category: category,
                                             message: message,
                                             fileName: fileName,
                                             lineNumber: lineNumber,
                                             functionName: functionName)
        logger.warning("\(resultMessage)")
    }
    
    
    /// Prints an error log message with the specified content and metadata.
    ///
    /// - Parameters:
    ///   - message: The content of the log message.
    ///   - category: The category of the log message.
    ///   - fileName: The name of the source file where the log message originated.
    ///   - lineNumber: The line number within the source file where the log message originated.
    ///   - functionName: The name of the function where the log message originated.
    public func error(_ message: String = "",
                      category: PrinterCategory = .logic,
                      fileName: String = #file,
                      lineNumber: Int = #line,
                      functionName: String = #function) {
        guard isEnabled(category: category) else { return }
        
        let resultMessage = getResultMessage(level: .error,
                                             category: category,
                                             message: message,
                                             fileName: fileName,
                                             lineNumber: lineNumber,
                                             functionName: functionName)
        logger.fault("\(resultMessage, privacy: .private)")
    }
}

// MARK: - Helpers
extension Printer {
    /// Formats a log message string by combining the level, category, thread, file, line number, function name, and the log message itself,
    /// based on the configuration in `PrinterSettings`.
    ///
    /// - Parameters:
    ///   - level: The log level.
    ///   - category: The category of the log message.
    ///   - message: The content of the log message.
    ///   - fileName: The name of the source file where the log message originated.
    ///   - lineNumber: The line number within the source file where the log message originated.
    ///   - functionName: The name of the function where the log message originated.
    /// - Returns: A fully formatted log message string.
    private func getResultMessage(level: PrinterLevel,
                                  category: PrinterCategory,
                                  message: String,
                                  fileName: String,
                                  lineNumber: Int,
                                  functionName: String) -> String {
        var components: [String] = []
        
        // Category
        if settings.isShowCategory {
            components.append(category.description)
        }
        
        // Date
        if settings.isShowDate, let date = settings.dateFormatter.string(for: Date()) {
            components.append(date)
        }
        
        // Level
        if settings.isShowLevel {
            components.append("[\(level.description)]")
        }
        
        // Thread name
        if settings.isShowThreadName {
            components.append(threadDescription)
        }
        
        // File name, line number
        if settings.isShowFileName {
            let fileComponent = (fileName as NSString).lastPathComponent
            if settings.isShowLineNumber {
                components.append("[\(fileComponent):\(lineNumber)]")
            } else {
                components.append("[\(fileComponent)]")
            }
        } else if settings.isShowLineNumber {
            components.append("[\(lineNumber)]")
        }
        
        // Function name
        if settings.isShowFunctionName {
            components.append(functionName)
        }
        
        // Message
        if !message.isEmpty {
            components.append(message)
        }
        
        return components.joined(separator: " ") + ""
    }
    
    /// Determines whether logging is enabled for the given log category.
    ///
    /// This method checks if the specified `PrinterCategory` is included in the set of
    /// enabled categories and **not** included in the set of disabled categories defined
    /// in the current `PrinterSettings`.
    ///
    /// - Parameter category: The category of the log message to evaluate.
    /// - Returns: `true` if logging is enabled for the category; otherwise, `false`.
    private func isEnabled(category: PrinterCategory) -> Bool {
        settings.enabledCategories.contains(category) &&
        !settings.disabledCategories.contains(category)
    }
}

private extension DispatchQueue {
    /// Retrieves the label of the current dispatch queue.
    static var currentQueueLabel: String? {
        return String(validatingCString: __dispatch_queue_get_label(nil))
    }
}

private extension Bundle {
    /// The display name of the bundle, as defined in the `CFBundleName` Info.plist key.
    var displayName: String? {
        return object(forInfoDictionaryKey: "CFBundleName") as? String
    }
}
