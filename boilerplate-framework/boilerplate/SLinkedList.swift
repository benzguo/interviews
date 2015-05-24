import Foundation

public class SLinkedListNode<T> {
    public var key: T
    public var next: SLinkedListNode?

    init(key: T) {
        self.key = key
    }
}

public struct SLinkedList<T: Equatable> {
    public var head : SLinkedListNode<T>? = nil

    public init() {
    }

    public mutating func appendKey(key: T) {
        if (head == nil) {
            head = SLinkedListNode<T>(key: key)
            return
        }

        var current = head!
        while current.next != nil {
            current = current.next!
        }
        current.next = SLinkedListNode<T>(key: key)
    }

    public var count : UInt {
        if (head == nil) {
            return 0
        }
        var count : UInt = 1
        var current = head!
        while current.next != nil {
            current = current.next!
            count += 1
        }
        return count
    }
}
