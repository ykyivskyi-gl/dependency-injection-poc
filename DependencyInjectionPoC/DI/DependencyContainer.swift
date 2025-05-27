import Foundation

struct DependencyContainer {
    @TaskLocal static var current = DependencyContainer()

    private var storage: [ObjectIdentifier: Any] = [:]

    subscript<K: DependencyKey>(key: K.Type) -> K.Value {
        get {
            if let value = storage[ObjectIdentifier(K.self)] as? K.Value {
                return value
            }
            return K.value
        }
        set {
            storage[ObjectIdentifier(K.self)] = newValue
        }
    }
}

func withDependencies<R>(
    _ update: (inout DependencyContainer) -> Void,
    operation: () throws -> R
) rethrows -> R {
    var copy = DependencyContainer.current
    update(&copy)
    return try DependencyContainer.$current.withValue(copy) {
        try operation()
    }
}
