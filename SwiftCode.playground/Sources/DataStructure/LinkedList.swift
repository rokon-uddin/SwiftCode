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
    copyNodes()
    head = Node(value: value, next: head)
    if tail == nil {
      tail = head
    }
  }
}

extension LinkedList {
  public mutating func append(_ value: Value) {
    copyNodes()
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
    copyNodes()

    guard tail !== node else {
      append(value)
      return tail!
    }

    node.next = Node(value: value, next: node.next)
    return node.next!
  }
}

extension LinkedList {
  @discardableResult
  public mutating func pop() -> Value? {
    copyNodes()
    defer {
      head = head?.next
      if isEmpty {
        tail = nil
      }
    }
    return head?.value
  }
}

extension LinkedList {
  @discardableResult
  public mutating func removeLast() -> Value? {
    copyNodes()
    guard let head = head else { return nil }

    guard head.next != nil else { return pop() }

    var previous = head
    var current = head
    while let next = head.next {
      previous = current
      current = next
    }
    previous.next = nil
    tail = previous
    return current.value
  }
}

extension LinkedList {
  @discardableResult
  public mutating func remove(after node: Node<Value>) -> Value? {
    guard let node = copyNodes(returningCopyOf: node) else { return nil }
    defer {
      if node.next === tail {
        tail = node
      }
      node.next = node.next?.next
    }
    return node.next?.value
  }
}

extension LinkedList: Collection {
  public var startIndex: Index {
    Index(node: head)
  }

  public var endIndex: Index {
    Index(node: tail?.next)
  }

  public func index(after i: Index) -> Index {
    Index(node: i.node?.next)
  }

  public subscript(position: Index) -> Value {
    position.node!.value
  }

  public struct Index: Comparable {
    public var node: Node<Value>?

    static public func == (lhs: Index, rhs: Index) -> Bool {
      switch (lhs.node, rhs.node) {
      case let (left?, right?):
        return left.next === right.next
      case (nil, nil):
        return true
      default:
        return false
      }
    }

    static public func < (lhs: Index, rhs: Index) -> Bool {
      guard lhs != rhs else { return false }
      let nodes = sequence(first: lhs.node) { $0?.next }
      return nodes.contains { $0 === rhs.node }
    }
  }
}

extension LinkedList {
  private mutating func copyNodes() {
    guard !isKnownUniquelyReferenced(&head) else { return }
    guard var oldNode = head else { return }

    head = Node(value: oldNode.value)

    var newNode = head

    while let nexOldNode = oldNode.next {
      newNode!.next = Node(value: nexOldNode.value)
      newNode = newNode!.next

      oldNode = nexOldNode
    }

    tail = newNode
  }

  private mutating func copyNodes(returningCopyOf node: Node<Value>?) -> Node<Value>? {
    guard !isKnownUniquelyReferenced(&head) else { return nil }
    guard var oldNode = head else { return nil }

    head = Node(value: oldNode.value)
    var newNode = head
    var nodeCopy: Node<Value>?

    while let nextOldNode = oldNode.next {
      if oldNode === node {
        nodeCopy = newNode
      }
      newNode!.next = Node(value: nextOldNode.value)
      newNode = newNode!.next
      oldNode = nextOldNode
    }
    return nodeCopy
  }
}
