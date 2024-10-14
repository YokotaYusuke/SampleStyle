import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("ScrollFixed", destination: ScrollFiexd())
                NavigationLink("Charts", destination: ScrollFiexd())
            }
        }
        .navigationTitle("StyleSamples")
    }
}

#Preview {
    ContentView()
}
