import Foundation

extension Array {
    mutating func removeFirst() -> T {
        return removeAtIndex(0)
    }

    mutating func insertFirst(e: T) {
        insert(e, atIndex: 0)
    }
}
