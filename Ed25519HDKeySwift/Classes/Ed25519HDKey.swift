//
//  Ed25519HDKey.swift
//  Ed25519HDKeySwift
//
//  Created by Chung Tran on 07/05/2021.
//

import Foundation
import TweetNacl
import IDZSwiftCommonCrypto

typealias Hex = String
typealias Path = String

struct Ed25519HDKey {
    static let ed25519Curve = "ed25519 seed"
    static let hardenedOffset = 0x80000000
    
    static func getMasterKeyFromSeed(_ seed: Hex) throws -> Keys? {
        let hmac = HMAC(algorithm: .sha512, key: arrayFrom(string: ed25519Curve))
        guard let entropy = hmac.update(arrayFrom(hexString: seed))?.final()
        else {
            return nil
        }
//        let hmacKey = ed25519Curve.data(using: .ascii)!
//        let hmac = HMAC(key: hmacKey.bytes, variant: .sha512)
//        let entropy = try hmac.authenticate(seed.bytes)
        let IL = Data(entropy[0..<32])
        let IR = Data(entropy[32...])
        return Keys(key: IL, chainCode: IR)
        
        
    }
    
    
}
