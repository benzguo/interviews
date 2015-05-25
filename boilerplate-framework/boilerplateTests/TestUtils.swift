import Foundation

public class TestUtils {

    public static func randomIntArray(count: Int) -> [Int] {
        var array = [Int]()
        for i in 0..<count {
            let value = Int(arc4random_uniform(1000))
            array.append(value)
        }
        return array
    }
}