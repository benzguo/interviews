import UIKit
import XCTest
import Dictionary

class DictionaryTests: XCTestCase {
    
//    func testValueForKeyReturnsCorrectValue() {
//        var sut = TimestampDictionary<String, String>()
//        sut.setValue("bar", forKey: "foo")
//
//        let result = sut.valueForKey("foo")
//        XCTAssert(result == "bar", "\(result) != bar")
//    }

    func testValueForKeyAtTimeReturnsCorrectValue() {
        var dates = [NSDate(timeIntervalSince1970: 20),
            NSDate(timeIntervalSince1970: 10),
            NSDate(timeIntervalSince1970: 0)]

        var sut = TimestampDictionary<String, String>(dateProvider: {
            return dates.removeLast()
            })
        sut.setValue("one", forKey: "foo")
        sut.setValue("two", forKey: "foo")
        sut.setValue("three", forKey: "foo")

        let result = sut.valueForKey("foo", atTime: NSDate(timeIntervalSince1970: 15))
        XCTAssert(result == "two", "\(result) != two")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
