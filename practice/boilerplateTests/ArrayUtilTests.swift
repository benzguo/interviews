import UIKit
import XCTest
import boilerplate

class arrayUtilTests: XCTestCase {

    func testFind() {
        let a = [1, 2, 3, 4, 5, 6]
        var index = ArrayUtil.find(a, value: 1)
        XCTAssert(index == 0)
        index = ArrayUtil.find(a, value: 5)
        XCTAssert(index == 4)
        index = ArrayUtil.find(a, value: 0)
        XCTAssert(index == nil)
    }

}
