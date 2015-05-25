import UIKit
import XCTest
import boilerplate

class arrayUtilTests: XCTestCase {

    var array : [Int] = TestUtils.randomIntArray(20000)

    override func setUp() {
        super.setUp()
    }

    func testFind() {
        let a = [1, 2, 3, 4, 5, 6]
        var index = ArrayUtils.find(a, value: 1)
        XCTAssert(index == 0)
        index = ArrayUtils.find(a, value: 5)
        XCTAssert(index == 4)
        index = ArrayUtils.find(a, value: 0)
        XCTAssert(index == nil)
    }

    func testPFind() {
        let a = [1, 2, 3, 4, 5, 6]
        var index = ArrayUtils.pfind(a, value: 1)
        XCTAssert(index == 0, "\(index)")
        index = ArrayUtils.pfind(a, value: 5)
        XCTAssert(index == 4, "\(index)")
        index = ArrayUtils.pfind(a, value: 0)
        XCTAssert(index == nil)
    }

    func testFindPerformance() {
        self.measureBlock() {
            ArrayUtils.find(self.array, value: 50)
            ArrayUtils.find(self.array, value: 50)
            ArrayUtils.find(self.array, value: 50)
            ArrayUtils.find(self.array, value: 50)
            ArrayUtils.find(self.array, value: 50)
            ArrayUtils.find(self.array, value: 50)
        }
    }

    func testPFindPerformance() {
        self.measureBlock() {
            ArrayUtils.pfind(self.array, value: 50)
            ArrayUtils.pfind(self.array, value: 50)
            ArrayUtils.pfind(self.array, value: 50)
            ArrayUtils.pfind(self.array, value: 50)
            ArrayUtils.pfind(self.array, value: 50)
            ArrayUtils.pfind(self.array, value: 50)
        }
    }

}
