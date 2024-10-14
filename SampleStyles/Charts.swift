import SwiftUI
import Charts

struct Data: Identifiable {
    var id = UUID()
    var name: String
    var value: Int
    var color: Color
}

let data_test: [Data] = [
    .init(name: "Akiko", value: 89, color: .green),
    .init(name: "Jun", value: 55, color: .red),
    .init(name: "Kenta", value: 80, color: .orange)
]


struct Charts: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                VStack {
                    Text("BarMark")
                    Chart(data_test) { data in
                        BarMark(
                            x: .value("Name", data.name),
                            y: .value("Value", data.value)
                        )
                        .foregroundStyle(data.color)
                    }
                    .frame(height: 300)
                }
                
                VStack {
                    Text("LineMark")
                    Chart(data_test) { data in
                        LineMark(
                            x: .value("Name", data.name),
                            y: .value("Value", data.value)
                        )
                    }
                    .frame(height: 300)
                }
            }
        }
    }
}

#Preview {
    Charts()
}
