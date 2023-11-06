import SwiftUI

// MARK: - Custom Cards

struct CustomCards: View {
    
    // MARK: - Properties

    let price: Int
    let discount: Int
    let amount: Int?
    let periodMonths: Int?
    
    // MARK: - Initializing

    init(price: Int, discount: Int, amount: Int?, periodMonths: Int?) {
        self.price = price
        self.discount = discount
        self.amount = amount
        self.periodMonths = periodMonths
    }

    
    // MARK: - View

    var body: some View {
        VStack {
            HStack {
                Text("\(price) $")
                    .font(.system(size: 16, weight: .medium))
                Spacer()
                Text(" - \(discount) %")
                    .foregroundColor(.white)
                    .font(.system(size: 12, weight: .bold))
                    .padding(3)
                    .background(Color("button"))
                    .cornerRadius(8)
            }
            if let amount = amount {
                Text(consultationTextByAmount(count : amount))
                    .frame(maxWidth: .infinity, alignment: .leading)
            } else if let periodMonths = periodMonths {
                Text(consultationTextByPeriod(count : periodMonths))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

// MARK: - return strings

func consultationTextByPeriod(count: Int) -> String {
        if count == 1 {
            return "\(count) месяц"
        } else if count >= 2 && count <= 4 {
            return "\(count) месяца"
        } else {
            return "\(count) месяцев"
        }
    }
    

// MARK: - return strings

func consultationTextByAmount(count: Int) -> String {
        if count == 1 {
            return "\(count) консультация"
        } else if count >= 2 && count <= 4 {
            return "\(count) консультации"
        } else {
            return "\(count) консультаций"
        }
    }


