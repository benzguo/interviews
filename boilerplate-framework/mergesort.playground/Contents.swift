import Foundation

extension Array {
    mutating func removeFirst() -> T {
        return removeAtIndex(0)
    }
}

func merge(l: [Int], r: [Int]) -> [Int] {
    var merged = [Int]()
    var l = l; var r = r;
    if l.count == 0 {
        return r
    }
    if r.count == 0 {
        return l
    }
    while (l.count > 0) {
        let lFirst = l[0]
        if (r.count == 0) {
            merged = merged + l
            break
        }
        let rFirst = r[0]
        if (rFirst < lFirst) {
            merged.append(rFirst)
            r.removeFirst()
        }
        else {
            merged.append(lFirst)
            l.removeFirst()
        }
    }
    merged = merged + r
    return merged
}

func _mergeSort(ps: [[Int]]) -> [Int] {
    if ps.count == 0 {
        return []
    }
    else if ps.count == 1 {
        return ps[0]
    }
    else {
        var ps = ps
        var newPs = [[Int]]()
        while ps.count > 0 {
            let first = ps.removeFirst()
            if ps.count > 0 {
                let second = ps.removeFirst()
                newPs.append(merge(first, second))
            }
            else {
                newPs.append(first)
            }
        }
        return _mergeSort(newPs)
    }
}
func mergeSort(a: [Int]) -> [Int] {
    return _mergeSort(a.map{[$0]})
}

mergeSort([2, 3, 1, 5, 0, 2, 9])

