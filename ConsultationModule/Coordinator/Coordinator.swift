import Foundation
import SwiftUI

// MARK: Coordinator

class Coordinator: ObservableObject {
    
    // MARK: - Properties

    @Published var screenStack: [ScreenInfo] = []
    
    /// transition to view
    
    func navigateTo(screenType: ScreenType) {
        if let existingScreenIndex = screenStack.firstIndex(where: { $0.screenType == screenType }) {
            screenStack.removeLast(screenStack.count - existingScreenIndex - 1)
            displayScreen(screenType)
        } else {
            let newScreen = ScreenInfo(screenType: screenType)
            screenStack.append(newScreen)
            displayScreen(screenType)
        }
    }
    
    /// create view

    private func displayScreen(_ screenType: ScreenType) {
        let viewController = UIHostingController(rootView: getSwiftUIView(for: screenType))
        UIApplication.shared.windows.first?.rootViewController = viewController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    /// switch view

    private func getSwiftUIView(for screenType: ScreenType) -> some View {
        switch screenType {
           case .consultation:
            return AnyView(MainModuleView(coordinator: self))
        }
    }
}
