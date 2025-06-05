//
//  PrinterLevel.swift
//  LogPrinter
//
//  Created by Maksym Yevtukhivskyi on 05.06.2025.
//

import Foundation

/// Represents the severity level of a log message.
///
/// Different levels indicate the importance or type of the log entry, helping
/// to filter and prioritize log output.
public enum PrinterLevel: String {
    /// Writes a debug message to the log.
    ///
    /// Debug messages are typically used for development and troubleshooting,
    /// providing detailed information about the application's behavior.
    case debug
    
    /// Writes information about a warning to the log.
    ///
    /// Warning messages indicate potential issues or important events that
    /// are not errors but might require attention.
    case warning
    
    /// Writes a message to the log about a bug or error that occurs when the app executes.
    ///
    /// Error messages indicate serious problems that might cause incorrect
    /// behavior or failures in the app.
    case error
    
    /// A textual description of the log level, capitalized.
    public var description: String {
        return rawValue.capitalized
    }
}
