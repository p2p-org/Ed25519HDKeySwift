//
//  DerivationPathTests.swift
//  Ed25519HDKeySwift_Tests
//
//  Created by Chung Tran on 07/05/2021.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import Ed25519HDKeySwift

class DerivationPathTests: XCTestCase {
    let path1 = "m/501'/0'/0/0"
    let path2 = "m/44'/501'/0'/0'"

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDerivationPathsValidation() throws {
        XCTAssertTrue(path1.isValidDerivationPath)
        XCTAssertTrue(path2.isValidDerivationPath)
    }

}
