import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("ScrollFixed", destination: ScrollFiexd())
                NavigationLink("Charts", destination: Charts())
                NavigationLink("Dialog", destination: DialogView())
                NavigationLink("SegmentedControl", destination: SegmentedControlView())
            }
            .navigationTitle("SwiftUI Style")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
