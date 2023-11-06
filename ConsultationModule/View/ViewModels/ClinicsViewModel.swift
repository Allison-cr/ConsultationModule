import Foundation

// MARK: - Clinic View Model

class ClinicsViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var clinics: [Clinic] = []

    // MARK: func load data clinics
    
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
