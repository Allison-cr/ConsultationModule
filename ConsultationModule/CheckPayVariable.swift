import SwiftUI

// MARK: - Check Pay Variable

struct CheckPayVarible: View {
    
    // MARK: - Properties

    let price: Int
    let discount: Int
    let amount: Int?
    let periodMonths: Int?
    
    
    // MARK: - View

    var body: some View {
        VStack(spacing: 16) {
            HStack {
                if let amount = amount {
                    Text(consultationTextByAmount(count : amount))
                }
                if let periodMonths = periodMonths {
                    Text(consultationTextByPeriod(count : periodMonths))
                }
                Spacer()
                Text("\(price) $")
            }
            .font(.system(size: 16, weight: .medium))
            HStack {
                Text("Ваша скидка \(discount) %")
                Spacer()
                Text("- \(price * (discount) / 100) $")
            }
            .font(.system(size: 16, weight: .medium))
            .foregroundColor(.red)
            HStack {
                Text("Итого : ")
                Spacer()
                Text("\(price * (100 - discount) / 100) $")
            }
            .font(.system(size: 16, weight: .bold))
        }
    }
}
