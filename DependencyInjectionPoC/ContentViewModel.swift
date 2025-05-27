import Foundation

class ContentViewModel: ObservableObject {
    @Dependency(\.dateGenerator) private var dateGenerator
    @Published private(set) var currentDate: Date = Date()
    
    func updateCurrentDate() {
        currentDate = dateGenerator.generateDate()
    }
}
