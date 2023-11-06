import SwiftUI
import Foundation

// MARK: - Consultation View Model

class ConsultationViewModel: ObservableObject {
    
    // MARK: - Properties

    @Published var consultationsByAmount: [ConsultationByAmount] = []
    @Published var consultationsByPeriod: [ConsultationByPeriod] = []

    
    // MARK: func load data consulations

    func loadConsultations() {
        DispatchQueue.main.async {
            guard let url = Bundle.main.url(forResource: "consultations", withExtension: "json") else {
                print("JSON file not found")
                return
            }
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let consultationsData = try decoder.decode(ConsultationClinicData.self, from: data)
                self.consultationsByAmount = consultationsData.consultationsByAmount
                self.consultationsByPeriod = consultationsData.consultationsByPeriod
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
    }
}

