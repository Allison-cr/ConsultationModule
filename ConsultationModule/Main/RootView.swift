import SwiftUI

// MARK: Root View

struct ContentView: View {
    
    // MARK: Properties
    
    @ObservedObject private var coordinator = Coordinator()

    // MARK: View
    
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



