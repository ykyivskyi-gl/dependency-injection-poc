import SwiftUI

@main
struct DependencyInjectionPoCApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: .init())
        }
    }
}
