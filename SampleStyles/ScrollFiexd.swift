import SwiftUI

struct ScrollFiexd: View {
    @State private var stickyOffset: CGFloat = 0.0
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Rectangle()
                    .frame(maxWidth: .infinity, minHeight: 100, maxHeight: 100)
                    .foregroundStyle(.gray)
                ScrollView {
                    VStack {
                        Text("title")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Divider()
                        
                        GeometryReader { geometry in
                            Color.clear
                                .preference(key: ScrollOffSetKey.self, value: geometry.frame(in: .global).minY)
                        }
                        .frame(height: 0)
                        
                        Rectangle()
                            .fill(.blue)
                            .frame(maxWidth: .infinity, minHeight: 100, maxHeight: 100)
                            .foregroundStyle(.blue)
                            .offset(y: stickyOffset <= 8 ? -(stickyOffset - 8) : 0)
                            .zIndex(stickyOffset <= 0 ? 1 : 0)
                        
                        Text("""
                     全体的に上に跳ねている感じと、体の返し（腕振り、脚の引き付け）が流れている印象です。
                     音にするとポーン、ポーンといった感じで、これをスタスタという感じにできればよろしいかと。
                     ①具体的には、腕ふりをもう少し小刻みにして、腕のリズムに下半身を合わせていくようにしてみてください。蹴って推進力を生もうとするのではなく着地後、膝から腿裏を意識して蹴るのではなく掻くようなイメージで。
                     腕ふりの角度等、腰の入り方は問題ないかと思います。
                    
                     ②アップダウンがあるコースで、少し速めのJogが出来る所があれば、基礎体力強化期間に週１回程度インターバルの代わりに入れて
                     全体的に上に跳ねている感じと、体の返し（腕振り、脚の引き付け）が流れている印象です。
                     音にするとポーン、ポーンといった感じで、これをスタスタという感じにできればよろしいかと。
                     ①具体的には、腕ふりをもう少し小刻みにして、腕のリズムに下半身を合わせていくようにしてみてください。蹴って推進力を生もうとするのではなく着地後、膝から腿裏を意識して蹴るのではなく掻くようなイメージで。
                     腕ふりの角度等、腰の入り方は問題ないかと思います。
                    
                     ②アップダウンがあるコースで、少し速めのJogが出来る所があれば、基礎体力強化期間に週１回程度インターバルの代わりに入れて
                    """).frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .onPreferenceChange(ScrollOffSetKey.self) { value in
                    let topOffset = 200.0
                    stickyOffset = value - topOffset
                }
                .navigationTitle("hoge")
                .navigationBarTitleDisplayMode(.inline)
            }
            .padding(10)
        }
    }
}

struct ScrollOffSetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

#Preview {
    ScrollFiexd()
}
