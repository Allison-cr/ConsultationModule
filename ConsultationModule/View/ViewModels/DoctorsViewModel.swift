import Foundation

class DoctorsViewModel: ObservableObject {
    @Published var doctors: [Doctor] = []

    func loadDoctors() {
        guard let url = Bundle.main.url(forResource: "doctors", withExtension: "json") else {
            print("JSON file not found")
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let doctorsData = try decoder.decode(DoctorData.self, from: data)
            self.doctors = doctorsData.doctors
        } catch {
            print("Error decoding JSON: \(error)")
        }
    }
}
