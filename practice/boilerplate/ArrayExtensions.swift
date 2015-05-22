import Foundation

extension Array {
    mutating func removeFirst() -> T {
        return removeAtIndex(0)
    }

    mutating func insertFirst(e: T) {
        insert(e, atIndex: 0)
    }

    func partition(includeElement: (T) -> Bool) -> ([T], [T]) {
        let excluded = self.filter { e in
            return !includeElement(e)
        }
        return (self.filter(includeElement), excluded)
    }
}
