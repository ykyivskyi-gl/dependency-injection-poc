import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Dependency injection PoC")
            
            Button(
                action: viewModel.updateCurrentDate,
                label: {
                    Text(viewModel.currentDate.formatted(date: .long, time: .complete))
                }
            )
            
        }
        .padding()
    }
}

#Preview {
    ContentView(viewModel: .init())
}
