import Foundation

func quickSort(a: [Int]) -> [Int] {
    if a.count <= 1 {
        return a
    }
    let pivot = a[Int(Float(a.count)/2.0)]
    return quickSort(a.filter { $0 < pivot }) +
        a.filter { $0 == pivot } +
        quickSort(a.filter { $0 > pivot })
}

quickSort([1, 2, 1, 5])