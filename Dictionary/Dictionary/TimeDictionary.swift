import Foundation

public struct TimestampDictionary<K: Hashable, V> {

    var contents : [K:[NSDate: V]]

    public var dateProvider : (()->NSDate)

    public func valueForKey(key: K) -> V? {
        var maybeTimeDict = contents[key]
        if let var timeDict = maybeTimeDict {
            var keys = timeDict.keys.array
            keys.sort({ (p : NSDate, c: NSDate) -> Bool in
                return p.earlierDate(c).isEqual(p)
            })
            return keys.first.flatMap { timeDict[$0] }
        }
        return nil
    }

    public func valueForKey(key: K, atTime time: NSDate) -> V? {
        var maybeTimeDict = contents[key]
        if let var timeDict = maybeTimeDict {
            var keys = timeDict.keys.array
            var latestTime : NSDate? = nil
            for k in keys {
                if k.isEqualToDate(time) {
                    latestTime = time
                    break
                }
                else if k.earlierDate(time).isEqualToDate(k) {
                    let compareOpt = latestTime.map { k.laterDate($0).isEqualToDate(k) }
                    if let compare = compareOpt where compare  {
                        latestTime = Optional(k)
                    }
                    else if latestTime == nil {
                        latestTime = Optional(k)
                    }
                }
            }
            return latestTime.flatMap { timeDict[$0] }
        }
        return nil
    }

    public mutating func setValue(value: V, forKey key: K) {
        let now = self.dateProvider()
        var maybeTimeDict = contents[key]
        if let var timeDict = maybeTimeDict {
            timeDict[now] = value
            contents[key] = timeDict
        }
        else {
            var timeDict = [NSDate: V]()
            timeDict[now] = value
            contents[key] = timeDict
        }
    }

    public init(dateProvider:()->NSDate = { NSDate() }) {
        self.contents = [K:[NSDate: V]]()
        self.dateProvider = dateProvider
    }
    
}