import XCTest
import boilerplate

class heapTests: XCTestCase {

    func testMaxHeap() {
        var heap = Heap<Int>(isMin: true)
        heap.add(4)
        heap.add(1)
        heap.add(2)
        heap.add(3)

        var e = heap.remove()
        XCTAssert(e == 1, "\(e)")
        e = heap.remove()
        XCTAssert(e == 2, "\(e)")
        e = heap.remove()
        XCTAssert(e == 3, "\(e)")
        e = heap.remove()
        XCTAssert(e == 4, "\(e)")
        e = heap.remove()
        XCTAssert(e == nil, "\(e)")
    }

}
