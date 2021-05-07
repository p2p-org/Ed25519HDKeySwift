//
//  CommonTests.swift
//  Ed25519HDKeySwift_Tests
//
//  Created by Chung Tran on 07/05/2021.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
import CryptoSwift
@testable import Ed25519HDKeySwift

class CommonTests: XCTestCase {
    let vector1Seed = "000102030405060708090a0b0c0d0e0f"

    func testGetMasterKeyFromSeed() throws {
        let keys = try Ed25519HDKey.getMasterKeyFromSeed(vector1Seed)
        XCTAssertEqual(keys.key.toHexString(), "2b4be7f19ee27bbf30c667b642d5f4aa69fd169872f8fc3059c08ebae2eb19e7")
        XCTAssertEqual(keys.chainCode.toHexString(), "90046a93de5380a72b5e45010748567d5ea02bbf6522f979e05c0d8d8ca9fffb")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
