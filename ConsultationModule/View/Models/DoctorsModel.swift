import Foundation

struct Doctor: Identifiable, Codable {
    var id: Int { doctorId }
    let doctorId: Int
    let avatar: String
    let doctorName: String
    let specializations: [String]
    let tags: [String]
    let isFavorite: Bool
    let rating: Double
    let clinicId: Int
    let title: String
}

struct DoctorData: Codable {
    let doctors: [Doctor]
}

