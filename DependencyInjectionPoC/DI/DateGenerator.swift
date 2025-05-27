import Foundation

class DateGenerator {
    private var generate: () -> Date

    init(generate: @escaping () -> Date = { Date() }) {
        self.generate = generate
    }

    func generateDate() -> Date {
        generate()
    }
}

struct DateGeneratorKey: DependencyKey {
    static var value: DateGenerator = DateGenerator()
}

extension DependencyContainer {
    var dateGenerator: DateGenerator {
        get { self[DateGeneratorKey.self] }
        set { self[DateGeneratorKey.self] = newValue }
    }
}
