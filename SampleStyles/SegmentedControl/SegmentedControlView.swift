import SwiftUI

enum SelectedDateType: String, CaseIterable {
    case day = "日"
    case week = "週"
    case month = "月"
    case sixMonth = "6ヶ月"
    case year = "年"
}

struct SegmentedControlView: View {
    @State private var selectedDateType: SelectedDateType = .day
    
    var body: some View {
        VStack(spacing: 0) {
            List {
                VStack {
                    Picker("", selection: self.$selectedDateType) {
                        ForEach(SelectedDateType.allCases, id: \.self) { selectedDateType in
                            Text("\(selectedDateType.rawValue)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    Text("選択中の日付: \(selectedDateType.rawValue)")
                    Spacer()
                }
                .frame(height: 400)
            }
            .listStyle(.plain)
            .background(Color(.systemGroupedBackground))
            .padding(0)
        }
        .navigationTitle("歩数")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        SegmentedControlView()
            .toolbarBackground(.clear, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("歩数")
        
    }
}
