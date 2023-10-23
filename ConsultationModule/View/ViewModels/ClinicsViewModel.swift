import Foundation

class ClinicsViewModel: ObservableObject {
    @Published var clinics: [Clinic] = []

    func loadClinics() {
        guard let url = Bundle.main.url(forResource: "clinics", withExtension: "json") else {
            print("JSON file not found")
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let clinicData = try decoder.decode(ClinicData.self, from: data)
            self.clinics = clinicData.clinics
        } catch {
            print("Error decoding JSON: \(error)")
        }
    }
}
