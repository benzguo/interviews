import UIKit
import XCTest
import boilerplate

class binarySearchTreeTests: XCTestCase {

    func testLevelOrderValues() {
        let bst = BSTNode<Int>(value: 5)
        bst.insert(1)
        bst.insert(3)
        bst.insert(4)
        bst.insert(6)
        bst.insert(7)
        XCTAssertEqual(bst.levelOrderValues, [5, 1, 6, 3, 7, 4])
    }

    func testPerformanceExample() {
        self.measureBlock() {

        }
    }
    
}
