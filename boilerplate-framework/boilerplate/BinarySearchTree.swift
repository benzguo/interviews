import Foundation

public class BSTNode <T: Comparable> {
    public var value: T
    public var left: BSTNode<T>?
    public var right: BSTNode<T>?

    public init(value: T) {
        self.value = value
    }

    public func insert(value: T) {
        if value < self.value {
            if let left = self.left {
                left.insert(value)
            }
            else {
                left = BSTNode<T>(value: value)
            }
        }
        if (value > self.value) {
            if let right = self.right {
                right.insert(value)
            }
            else {
                right = BSTNode<T>(value: value)
            }
        }
    }

    /// Prints the values in level order
    public var levelOrderValues : [T] {
        var values = [T]()
        var nodes = [BSTNode<T>]()
        nodes.append(self)

        while !nodes.isEmpty {
            let node = nodes.removeLast()
            values.append(node.value)
            if let l = node.left {
                nodes.insertFirst(l)
            }
            if let r = node.right {
                nodes.insertFirst(r)
            }
        }
        return values
    }
}
