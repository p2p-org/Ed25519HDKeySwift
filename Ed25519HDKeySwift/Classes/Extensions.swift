//
//  Extensions.swift
//  Ed25519HDKeySwift
//
//  Created by Chung Tran on 07/05/2021.
//

import Foundation

// MARK: - Derivation path
extension String {
    var isValidDerivationPath: Bool {
        range(of: "^m(\\/[0-9]+'?)+$", options: .regularExpression, range: nil, locale: nil) != nil
    }
    
    var replacingDerive: String {
        replacingOccurrences(of: "'", with: "")
    }
}
