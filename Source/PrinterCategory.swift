//
//  PrinterCategory.swift
//  LogPrinter
//
//  Created by Maksym Yevtukhivskyi on 05.06.2025.
//

import Foundation

/// Represents various logging categories used to classify log messages throughout the app.
///
/// Categories are grouped by their general functionality, allowing for fine-grained
/// control and filtering of log output.
public enum PrinterCategory: Equatable, Sendable {
    // UI & UX
    case ui
    case theme
    case onboarding
    
    // App Logic & State
    case logic
    case appLifecycle
    case viewLifecycle
    case performance
    case experiment
    case debugTools
    case errorHandling
    case cleanup
    case migration
    
    // Networking & Connectivity
    case api(_ subcategory: ApiSubcategory)
    case networking
    case connection
    case retry
    case upload
    case download
    case cache
    case timeout
    case refresh
    case push
    case bluetooth
    case deeplink
    
    // User & Authentication
    case auth
    case permissions
    
    // Data & Storage
    case database
    case file
    
    // Location & Navigation
    case location
    case navigation
    
    // Payments & Analytics
    case payment
    case analytics
    
    // Settings & Configuration
    case settings
    
    // Media & Player
    case player
    
    public enum ApiSubcategory: Sendable {
        case info
        case success
        case error
    }
    
    public static let allCases: [PrinterCategory] = [
        // UI & UX
        .ui,
        .theme,
        .onboarding,
        
        // App Logic & State
        .logic,
        .appLifecycle,
        .viewLifecycle,
        .performance,
        .experiment,
        .debugTools,
        .errorHandling,
        .cleanup,
        .migration,
        
        // Networking & Connectivity
        .api(.info),
        .api(.success),
        .api(.error),
        .networking,
        .connection,
        .retry,
        .upload,
        .download,
        .cache,
        .timeout,
        .refresh,
        .push,
        .bluetooth,
        .deeplink,
        
        // User & Authentication
        .auth,
        .permissions,
        
        // Data & Storage
        .database,
        .file,
        
        // Location & Navigation
        .location,
        .navigation,
        
        // Payments & Analytics
        .payment,
        .analytics,
        
        // Settings & Configuration
        .settings,
        
        // Media & Player
        .player
    ]
    
    var description: String {
        switch self {
            // UI & UX
        case .ui: return "📱 UI"
        case .theme: return "🎨 THEME"
        case .onboarding: return "🚀 ONBOARDING"
            
            // App Logic & State
        case .logic: return "🛠 LOGIC"
        case .appLifecycle: return "📲 APP LIFECYCLE"
        case .viewLifecycle: return "♻️ VIEW LIFECYCLE"
        case .performance: return "⚡️ PERFORMANCE"
        case .experiment: return "🧪 EXPERIMENT"
        case .debugTools: return "🧰 DEBUG TOOLS"
        case .errorHandling: return "🚨 ERROR HANDLING"
        case .cleanup: return "🧹 CLEANUP"
        case .migration: return "🧬 MIGRATION"
            
            // Networking & Connectivity
        case .api(let subcategory):
            switch subcategory {
            case .info: return "📡 API"
            case .success: return "📡 API ✅"
            case .error: return "📡 API ❌"
            }
        case .networking: return "🌐 NETWORKING"
        case .connection: return "🔌 CONNECTION"
        case .retry: return "🔁 RETRY"
        case .upload: return "📤 UPLOAD"
        case .download: return "📥 DOWNLOAD"
        case .cache: return "🗄 CACHE"
        case .timeout: return "⏳ TIMEOUT"
        case .refresh: return "🔄 REFRESH"
        case .push: return "📬 PUSH"
        case .bluetooth: return "📶 BLUETOOTH"
        case .deeplink: return "🔗 DEEPLINK"
            
            // User & Authentication
        case .auth: return "🔑 AUTH"
        case .permissions: return "🔐 PERMISSIONS"
            
            // Data & Storage
        case .database: return "💾 DATABASE"
        case .file: return "🗂 FILE"
            
            // Location & Navigation
        case .location: return "📍 LOCATION"
        case .navigation: return "🧭 NAVIGATION"
            
            // Payments & Analytics
        case .payment: return "💳 PAYMENT"
        case .analytics: return "📑 ANALYTICS"
            
            // Settings & Configuration
        case .settings: return "⚙️ SETTINGS"
            
            // Media & Player
        case .player: return "🎦 PLAYER"
        }
    }
}
