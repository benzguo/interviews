import Foundation

/// Adjacency list
public struct Vertex<T> {
    public let value : T
    public var edges : [Edge<T>]
    public init(value: T, edges: [Edge<T>]) {
        self.value = value
        self.edges = edges
    }

    public mutating func connectTo(vertex: Vertex<T>, weight: Int = 1) {
        let edge = Edge(from: self, to: vertex, weight: weight)
        edges.append(edge)
    }
}

public struct Edge<T> {
    public let from : Vertex<T>
    public let to : Vertex<T>
    public let weight : Int
    public init(from: Vertex<T>, to: Vertex<T>, weight: Int) {
        self.from = from
        self.to = to
        self.weight = weight
    }
}

