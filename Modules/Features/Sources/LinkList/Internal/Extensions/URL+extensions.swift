//
//  URL+extensions.swift
//
//
//  Created by Kamaal M Farah on 09/09/2023.
//

import SwiftUI

extension URL {
    var isValid: Bool {
        guard let detector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        else { return false }

        let matches = detector.matches(
            in: absoluteString,
            options: [],
            range: NSRange(location: 0, length: absoluteString.utf16.count)
        )
        return !matches.isEmpty
    }
}
