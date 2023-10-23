import Foundation
import SwiftUI

class Coordinator: ObservableObject {
    @Published var screenStack: [ScreenInfo] = []
    
    func navigateTo(screenType: ScreenType) {
        if let existingScreenIndex = screenStack.firstIndex(where: { $0.screenType == screenType }) {
            print("Returning to existing screen: \(screenType)")
            screenStack.removeLast(screenStack.count - existingScreenIndex - 1)
            displayScreen(screenType)
        } else {
            print("Creating and opening a new screen: \(screenType)")
            let newScreen = ScreenInfo(screenType: screenType)
            screenStack.append(newScreen)
            displayScreen(screenType)
        }
    }
    
    private func displayScreen(_ screenType: ScreenType) {
        let viewController = UIHostingController(rootView: getSwiftUIView(for: screenType))
        UIApplication.shared.windows.first?.rootViewController = viewController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    private func getSwiftUIView(for screenType: ScreenType) -> some View {
        switch screenType {
           case .consultation:
            return AnyView(MainModuleView(coordinator: self))
        }
    }
}
