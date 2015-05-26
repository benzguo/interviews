import XCTest
import boilerplate

class wordWrapTests: XCTestCase {

    func testWrap() {
        let result = WordWrap.wrap("aaa bb cc ddddd", width: 6)
        XCTAssertEqual(result, ["aaa", "bb cc", "ddddd"])
    }

    func testWords() {
        let result = WordWrap.words("aaa bb cc ddddd")
        XCTAssertEqual(result, ["aaa", "bb", "cc", "ddddd"])
    }

    func testCost() {
        let greedy = ["aaa bb", "cc", "ddddd"]
        let optimal = ["aaa", "bb cc", "ddddd"]
        let greedyCost = WordWrap.cost(greedy, width: 6)
        let optimalCost = WordWrap.cost(optimal, width: 6)
        XCTAssertEqual(greedyCost, 17)
        XCTAssertEqual(optimalCost, 11)
    }

}
