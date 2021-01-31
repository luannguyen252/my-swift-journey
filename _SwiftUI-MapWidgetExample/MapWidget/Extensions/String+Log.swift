//
//  String+Log.swift
//  MapWidget
//
//  Created by Felix Mau on 15.10.20.
//  Copyright © 2020 Felix Mau. All rights reserved.
//

import Foundation

/// Based on: https://gist.github.com/fxm90/08a187c5d6b365ce2305c194905e61c2
extension String {
    // MARK: - Types

    enum LogLevel {
        case info
        case error
    }

    // MARK: - Private properties

    /// The formatter we use to prefix the log output with the current date and time.
    private static let logDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss.SSS"

        return dateFormatter
    }()

    // MARK: - Public methods

    func log(level: LogLevel, file: String = #file, function _: String = #function, line: UInt = #line) {
        #if DEBUG
            let logIcon: Character
            switch level {
            case .info:
                logIcon = "ℹ️"

            case .error:
                logIcon = "⚠️"
            }

            let formattedDate = Self.logDateFormatter.string(from: Date())
            let filename = URL(fileURLWithPath: file).lastPathComponent

            print("\(logIcon) – \(formattedDate) – \(filename):\(line) \(self)")
        #endif
    }
}
