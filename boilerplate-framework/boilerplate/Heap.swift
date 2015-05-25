import Foundation

public struct Heap<T: Comparable> {
    public var contents : [T]
    let isMin : Bool

    public init(isMin: Bool) {
        self.contents = [T]()
        self.isMin = isMin
    }

    public mutating func add(element: T) {
        contents.append(element)
        var n = contents.count - 1
        while n > 0 &&
            (isMin ? contents[n] < contents[Heap.parent(n)] : contents[n] > contents[Heap.parent(n)]) {
            let current = contents[n]
            contents[n] = contents[Heap.parent(n)]
            contents[Heap.parent(n)] = current
            n = Heap.parent(n)
        }
    }

    public mutating func remove() -> T? {
        if contents.count == 0 {
            return nil
        }
        else {
            let root = contents[0]
            contents[0] = contents[contents.count - 1]
            contents.removeLast()
            adjust(fromRoot: 0)
            return root
        }
    }

    /// Adjusts the tree rooted at n so that it becomes a heap
    mutating func adjust(fromRoot n: Int) {
        if Heap.isLeaf(n, count: contents.count) {
            return
        }
        let currentVal = contents[n]
        let leftIndex = Heap.leftChild(n)
        let rightIndex = Heap.rightChild(n)
        let hasLeftChild = leftIndex < contents.count
        let hasRightChild = rightIndex < contents.count

        if hasLeftChild && hasRightChild {
            let leftVal = contents[leftIndex]
            let rightVal = contents[rightIndex]
            let indexToSwap = isMin ? (leftVal < rightVal ? leftIndex : rightIndex) :
                (leftVal > rightVal ? leftIndex : rightIndex)
            let valToSwap = contents[indexToSwap]
            let compareResult = isMin ? currentVal > valToSwap : currentVal < valToSwap
            if compareResult {
                contents[indexToSwap] = currentVal
                contents[n] = valToSwap
                adjust(fromRoot: indexToSwap)
            }
        }
        else if hasLeftChild {
            let leftVal = contents[leftIndex]
            let compareResult = isMin ? currentVal > leftVal : currentVal < leftVal
            if compareResult {
                contents[leftIndex] = currentVal
                contents[n] = leftVal
                adjust(fromRoot: leftIndex)
            }
        }
        else if hasRightChild {
            let rightVal = contents[rightIndex]
            let compareResult = isMin ? currentVal > rightVal : currentVal < rightVal
            if compareResult {
                contents[rightIndex] = currentVal
                contents[n] = rightVal
                adjust(fromRoot: rightIndex)
                return
            }
        }
    }

    static func leftChild(i: Int) -> Int {
        return 2*i + 1
    }

    static func rightChild(i: Int) -> Int {
        return 2*i + 2
    }

    static func parent(i: Int) -> Int {
        return Int(floor(Float(i - 1)/2.0))
    }

    static func isLeaf(i: Int, count: Int) -> Bool {
        let left = leftChild(i)
        let right = rightChild(i)
        if (left < 0 || left >= count) &&
            (right < 0 || right >= count) {
            return true
        }
        return false
    }

}