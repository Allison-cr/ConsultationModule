import Foundation

// MARK: -  Clinic Model

struct Clinic: Identifiable, Codable {
    
    // MARK: - Properties

    /// The id of 'Clinic'
    var id: Int { clinicId }
    
    /// The id of 'Clinic'
    let clinicId: Int
    
    /// The title of 'Clinic'
    let clinicTitle: String
    
    /// The city id of 'Clinic'
    let cityId: Int
    
    /// The city name of 'Clinic'
    let cityName: String

}

// MARK: -  ClinicData

struct ClinicData: Codable {
    
    let clinics: [Clinic]
}
