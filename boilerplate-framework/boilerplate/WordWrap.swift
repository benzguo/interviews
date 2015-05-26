import Foundation

public enum WordWrap {

    public static func wrap(text: String, width: Int) -> [String] {
        var words = WordWrap.words(text)
        let wordCount = words.count
        var costs = [Int]()
        return words
    }

    /// sum of squares of EOL space
    public static func cost(lines: [String], width: Int) -> Int {
        return lines.map { count($0) }.reduce(0, combine: { (a, r) -> Int in
            a + ((width - r)*(width - r))
        })
    }

    public static func words(text: String) -> [String] {
        return split(text) { $0 == " " }
    }

    // x < y. space in line y when word x terminates the yth line
    // space[x, y] = space[x, y-1] - len(words(x)) - 1

}
