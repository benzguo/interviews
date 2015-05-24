import Foundation

public enum ArrayUtil {
    public static func partition<T>(array: [T], includeElement: T -> Bool) -> ([T], [T]) {
        let excluded = array.filter { e in
            return !includeElement(e)
        }
        return (array.filter(includeElement), excluded)
    }

    public static func find<T: Comparable>(array: [T], value: T) -> Int? {
        return _find(array, value: value, offset: 0)
    }

    /// Binary search
    static func _find<T: Comparable>(array: [T], value: T, offset: Int) -> Int? {
        let count = array.count
        let midIndex = Int(Float(count)/2.0)
        if midIndex >= count {
            return nil
        }
        let mid = array[midIndex]
        if mid == value {
            return Optional(midIndex + offset)
        }
        let left = Array(array[0..<midIndex])
        let right = Array(array[midIndex+1..<count])
        let leftIndex = _find(left, value: value, offset: offset)
        let rightIndex = _find(right, value: value, offset: offset + midIndex + 1)
        return leftIndex ?? rightIndex ?? nil
    }
}
