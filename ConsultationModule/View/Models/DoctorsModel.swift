import Foundation

// MARK: - Doctor

struct Doctor: Identifiable, Codable {
  
    // MARK: - Properties

    ///  The  id of 'Doctor'
    var id: Int { doctorId }
   
    ///  The doctor id of 'Doctor'
    let doctorId: Int
    
    ///  The avatar of 'Doctor'
    let avatar: String
    
    ///  The doctor name of 'Doctor'
    let doctorName: String
    
    ///  The specializations of 'Doctor'
    let specializations: [String]
    
    ///  The tags of 'Doctor'
    let tags: [String]
    
    ///  The favorite of 'Doctor'
    let isFavorite: Bool
    
    ///  The rating of 'Doctor'
    let rating: Double
    
    ///  The clinic Id of 'Doctor'
    let clinicId: Int
    
    ///  The title of 'Doctor'
    let title: String
}


// MARK: - Doctor Data

struct DoctorData: Codable {
        
    let doctors: [Doctor]
}

