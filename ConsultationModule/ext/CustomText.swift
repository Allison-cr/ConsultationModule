import SwiftUI

// MARK : Custom Text

struct CustomText: View {
    
    // MARK: - Properties

    var infoType: InfoType
    
    /// return strings
    var title: String {
        switch infoType {
        case .first:
            return "Эти пакеты консультаций применимы ещё к 264 врачам"
        case .second:
            return "Срок действия 24 месяца с момента покупки. Подробнее"
        }
    }
    
    // MARK: View

    var body: some View {
        HStack(spacing: 0) {
            Rectangle()
                .frame(width: 1, height: 48)
                .foregroundColor(Color("button"))
                .border(Color("button"), width: 2)
            Text(title)
                .foregroundColor(Color("text-button"))
                .padding(8)
                .font(.system(size: 16))
            Spacer()
        }
       .padding(.bottom, 8)
    }
}
