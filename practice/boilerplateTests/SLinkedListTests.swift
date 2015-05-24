import UIKit
import XCTest
import boilerplate

class singlyLinkedListTests: XCTestCase {
    
    func testAppendKey() {
        var list = SLinkedList<Int>()
        XCTAssertEqual(list.count, 0)
        list.appendKey(1)
        XCTAssertEqual(list.count, 1)
    }
    
    func testPerformanceExample() {
        self.measureBlock() {

        }
    }
    
}
