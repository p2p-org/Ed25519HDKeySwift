//
//  Ed25519HDKey.swift
//  Ed25519HDKeySwift
//
//  Created by Chung Tran on 07/05/2021.
//

import Foundation
import TweetNacl
import CryptoSwift

typealias Hex = String
typealias Path = String

struct Ed25519HDKey {
    enum Error: Swift.Error {
        case invalidDerivationPath
    }
    
    static let ed25519Curve = "ed25519 seed"
    static let hardenedOffset = 0x80000000
    
    static func getMasterKeyFromSeed(_ seed: Hex) throws -> Keys {
        let hmacKey = ed25519Curve.bytes
        let hmac = HMAC(key: hmacKey, variant: .sha512)
        let entropy = try hmac.authenticate(Data(hex: seed).bytes)
        let IL = Data(entropy[0..<32])
        let IR = Data(entropy[32...])
        return Keys(key: IL, chainCode: IR)
    }
    
    private static func CKDPriv(keys: Keys, index: UInt32) throws -> Keys {
        var bytes = [UInt8]()
        bytes.append(UInt8(0))
        bytes += keys.key.bytes
        bytes += index.bytes
        let data = Data(bytes)
        
        let hmac = HMAC(key: keys.chainCode.bytes, variant: .sha512)
        
        let entropy = try hmac.authenticate(data.bytes)
        let IL = Data(entropy[0..<32])
        let IR = Data(entropy[32...])
        return Keys(key: IL, chainCode: IR)
    }
    
    static func getPublicKey(privateKey: Data, withZeroBytes: Bool = true) throws -> Data
    {
        let keyPair = try NaclSign.KeyPair.keyPair(fromSeed: privateKey)
        return keyPair.publicKey
    }
    
    static func derivePath(_ path: Path, seed: Hex, offSet: Int = hardenedOffset) throws -> Keys
    {
        guard path.isValidDerivationPath else {
            throw Error.invalidDerivationPath
        }
        
        let keys = try getMasterKeyFromSeed(seed)
        let segments = path.components(separatedBy: "/")[1...]
            .map {$0.replacingDerive}
            .map {Int($0)!}
        
        return try segments.reduce(keys, {try CKDPriv(keys: $0, index: UInt32($1+offSet))})
    }
}
