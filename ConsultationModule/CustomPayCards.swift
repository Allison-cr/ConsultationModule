import Foundation
import SwiftUI

// MARK: - Custom Pay Cards

struct CustomPayCards: View {
    
    // MARK: - Properties

    var payType: PayType
    var isSelected: Bool
    var onTap: () -> Void
    
    
    // MARK: - View

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Image(payType.rawValue)
                    .padding([.leading, .top], 8)
                Spacer()
            }
            HStack(spacing: 0) {
                Spacer()
                Text("0000")
                    .font(.system(size: 14))
                    .padding(8)
            }
        }
        .frame(width: 114)
        .foregroundColor(Color("text-button"))
        .background(Color.white)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(isSelected ? Color("button") : .clear, lineWidth: 2)
        )
        .onTapGesture {
            onTap()
        }
    }
}
struct EmptyCard: View {
    var body: some View {
        Text("Новая карта")
        .font(.system(size: 14))
        .padding(.vertical, 24)
        .frame(width: 114)
        .foregroundColor(Color("text-button"))
        .background(.white)
        .cornerRadius(8)
    }
}
