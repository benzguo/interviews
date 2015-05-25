import XCTest
import boilerplate

class heapTests: XCTestCase {

    func testMaxHeap() {
        var heap = Heap<Int>(isMin: false)
        heap.add(10)
        heap.add(5)
        heap.add(20)
        heap.add(1)
        heap.add(30)
        heap.add(2)
        heap.add(3)
        var e = heap.remove()
        XCTAssert(e == 1, "\(e)")
    }

}
