import SwiftUI

struct ScrollFiexd: View {
    @State private var stickyOffset: CGFloat = 0
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Rectangle()
                    .frame(maxWidth: .infinity, minHeight: 100, maxHeight: 100)
                    .foregroundStyle(.green.opacity(0.6))
                
                ScrollView {
                    VStack {
                        Text("title")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Divider()
                        
                        GeometryReader { geometry in
                            Color.clear
                                .preference(key: ScrollOffSetKey.self, value: geometry.frame(in: .named("ScrollView")).origin)
                        }
                        .frame(height: 0)
                        
                        Rectangle()
                            .fill(.blue.opacity(0.6))
                            .frame(maxWidth: .infinity, minHeight: 100, maxHeight: 100)
//                            .offset(y: stickyOffset <= 8 ? -(stickyOffset - 8) : 0)
//                            .zIndex(stickyOffset <= 0 ? 1 : 0)
                        
                        Text(rawText).frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .coordinateSpace(name: "ScrollView")
                .onPreferenceChange(ScrollOffSetKey.self) { value in
                    self.stickyOffset = value.y
                }
            }
            .padding(10)
        }
        .navigationTitle("Scroll Fixed")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ScrollOffSetKey: PreferenceKey {
    static var defaultValue: CGPoint = .zero
    
    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {}
}

#Preview {
    ScrollFiexd()
}
