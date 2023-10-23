import SwiftUI

struct ContentView: View {
    @ObservedObject private var coordinator = Coordinator()

    var body: some View {
            VStack {
                Button(action: {
                    coordinator.navigateTo(screenType: .consultation)
                }) {
                    Text("Navigate to Consultation")
                }
            }
        }
    
    private func screenToString(_ screen: ScreenType) -> String {
        switch screen {
        case .consultation:
            return "Consultation View"
        }
    }
}



