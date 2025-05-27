import Foundation

protocol DependencyKey<Value> {
    associatedtype Value = Self

    static var value: Value { get }
}

@propertyWrapper
struct Dependency<Value> {
    private let keyPath: KeyPath<DependencyContainer, Value>

    var wrappedValue: Value {
        DependencyContainer.current[keyPath: keyPath]
    }

    init(_ keyPath: KeyPath<DependencyContainer, Value>) {
        self.keyPath = keyPath
    }
}
