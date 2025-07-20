import SwiftUI

struct HistoryView: View {
    var history: [(expression: String, result: String)]

    var body: some View {
        List {
            ForEach(history.indices, id: \.self) { index in
                let item = history[index]
                VStack(alignment: .leading) {
                    Text("Expression: \(item.expression)")
                        .font(.headline)
                    Text("Result: \(item.result)")
                        .font(.subheadline)
                }
                .padding(.vertical, 4)
            }
        }
        .navigationTitle("History")
    }
}
