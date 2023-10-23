import Foundation

struct Clinic: Identifiable, Codable {
    var id: Int { clinicId }
    let clinicId: Int
    let clinicTitle: String
    let cityId: Int
    let cityName: String
}

struct ClinicData: Codable {
    let clinics: [Clinic]
}
