import Foundation

struct ConsultationClinicData: Codable {
    let clinics: [ConsultationClinic]
}

struct ConsultationClinic: Codable {
    let clinicId: Int
    let consultationsByAmount: [Consultation]
    let consultationsByPeriod: [Consultation]
}

struct Consultation: Codable {
    let serviceId: Int
    let code: String
    let price: Int
    let amount: Int
    let discount: Int
    let periodMonths: Int?
}
