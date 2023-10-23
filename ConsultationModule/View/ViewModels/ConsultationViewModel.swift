import Foundation

class ConsultationViewModel: ObservableObject {
    @Published var consultationsByAmount: [Consultation] = []
    @Published var consultationsByPeriod: [Consultation] = []

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
                if let clinic = consultationsData.clinics.first {
                    self.consultationsByAmount = clinic.consultationsByAmount
                    self.consultationsByPeriod = clinic.consultationsByPeriod
                } else {
                    print("No clinics data found in JSON")
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
    }
}
