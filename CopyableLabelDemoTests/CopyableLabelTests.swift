//
//  CopyableLabelTests.swift
//  CopyableLabelDemoTests
//
//  Created by Nonnus on 08.09.18.
//  Copyright © 2018 Silicon Studios. All rights reserved.
//

import XCTest
@testable import CopyableLabelDemo

class CopyableLabelTests: XCTestCase {

    let label = CopyableLabel(frame: .zero)
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCopyableLabelHasCopyableProperty() {
        XCTAssertNotNil(label.isCopyable, "isCopyable has to exist")
    }
    
    func testCopyableLabelIsCopyable() {
        XCTAssert(label.isCopyable, "isCopyable has to be true")
    }
    
    func testCopyableLabelHasGestureRecognizers() {
        guard let gestureRecognizers = label.gestureRecognizers else {
            XCTFail("")
            return
        }
        XCTAssert(!gestureRecognizers.isEmpty, "gestureRecognizers can not be empty")
    }
}
