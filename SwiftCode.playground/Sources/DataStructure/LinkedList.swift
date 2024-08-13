public class Node<Value> {
  public var value: Value
  public var next: Node?

  public init(value: Value, next: Node? = nil) {
    self.value = value
    self.next = next
  }
}

extension Node: CustomStringConvertible {
  public var description: String {
    guard let next = next else { return "\(value)" }
    return "\(value) -> " + String(describing: next) + " "
  }
}

public struct LinkedList<Value> {
  public var head: Node<Value>?
  public var tail: Node<Value>?

  public init() {}

  public var isEmpty: Bool {
    head == nil
  }
}

extension LinkedList: CustomStringConvertible {
  public var description: String {
    guard let head = head else { return "Empty list" }
    return String(describing: head)
  }
}

extension LinkedList {
  public mutating func push(_ value: Value) {
    head = Node(value: value, next: head)
    if tail == nil {
      tail = head
    }
  }
}

extension LinkedList {
  public mutating func append(_ value: Value) {
    guard !isEmpty else {
      push(value)
      return
    }
    tail?.next = Node(value: value)
    tail = tail?.next
  }
}

extension LinkedList {
  public func node(at index: Int) -> Node<Value>? {
    var currentNode = head
    var currentIndex = 0

    while currentNode != nil && currentIndex < index {
      currentNode = currentNode?.next
      currentIndex += 1
    }

    return currentNode
  }
}

extension LinkedList {
  @discardableResult
  public mutating func inset(_ value: Value, after node: Node<Value>) -> Node<Value> {

    guard tail !== node else {
      append(value)
      return tail!
    }

    node.next = Node(value: value, next: node.next)
    return node.next!
  }
}
