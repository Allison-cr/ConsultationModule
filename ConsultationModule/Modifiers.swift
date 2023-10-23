import SwiftUI

struct CustomModifier: ViewModifier {
    let textColor: Color
    let buttonColor : Color
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .frame(maxWidth: .infinity)
            .background(buttonColor)
            .foregroundColor(textColor)
            .cornerRadius(8)
            .font(.system(size: 16, weight: .medium))
    }
}
struct PickerStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .tint(.black)
            .frame(maxWidth: .infinity)
            .background(.white)
            .pickerStyle(.menu)
            .cornerRadius(8)
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
    }
}

struct LazyVStackStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16,weight: .semibold))
            .foregroundColor(.black)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(.white)
            .cornerRadius(8)
    }
}

extension View {
    func customStyle(textColor: Color, buttonColor: Color) -> some View {
        modifier(CustomModifier(textColor: textColor, buttonColor: buttonColor))
    }
}
extension View {
    func applyPickerStyle() -> some View {
        modifier(PickerStyleModifier())
    }
}
extension View {
    func applyLazyVStackStyle() -> some View {
        modifier(LazyVStackStyleModifier())
    }
}
