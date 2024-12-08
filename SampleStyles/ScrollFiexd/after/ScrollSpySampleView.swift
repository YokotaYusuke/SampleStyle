import SwiftUI

struct ScrollSpySampleView: View {
    @State var scrollOffset: CGFloat = 0
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Scroll Content")
            }
            .scrollSpy("ScrollView", scrollOffset: $scrollOffset)
        }
        .coordinateSpace(name: "ScrollView")
    }
}

#Preview {
    ScrollSpySampleView()
}
