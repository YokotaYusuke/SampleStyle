import SwiftUI

struct DialogView: View {

    @State private var shouldPresentPopUpDialog = false

    var body: some View {
        ZStack {
            Button {
                withAnimation {
                    shouldPresentPopUpDialog = true
                }
            } label: {
                Text("Present Pop-up Dialog")
            }

            if shouldPresentPopUpDialog {
                PopUpDialogView(
                    isPresented: $shouldPresentPopUpDialog
                )
            }
        }
    }
}


#Preview {
    DialogView()
}
