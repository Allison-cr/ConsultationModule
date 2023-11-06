import Foundation

// MARK: -  Arrays of Consultation mode

struct ConsultationClinicData: Codable {
    
    /// Amount array
    let consultationsByAmount: [ConsultationByAmount]
    
    /// Period array
    let consultationsByPeriod: [ConsultationByPeriod]
}

// MARK: -  Array of amount Consultation mode

struct ConsultationByAmount: Codable, Hashable, Consultation {
    
    // MARK: - Properties
    
    ///  The service id of 'Consultation'
    let serviceId: Int
    
    ///  The code of 'Consultation'
    let code: String
    
    ///  The clinic id of 'Consultation'
    let clinicId: Int
    
    ///  The price of 'Consultation'
    let price: Int
    
    ///  The amount of 'Consultation'
    let amount: Int
    
    ///  The discount of 'Consultation'
    let discount: Int
}

// MARK: -  Array of period Consultation mode

struct ConsultationByPeriod: Codable, Hashable, Consultation {
   
    // MARK: - Properties
    
    ///  The service id of 'Consultation'
    let serviceId: Int
    
    ///  The code of 'Consultation'
    let code: String
    
    ///  The clinic id of 'Consultation'
    let clinicId: Int
    
    ///  The price of 'Consultation'
    let price: Int
    
    ///  The period months of 'Consultation'
    let periodMonths: Int
    
    ///  The discount of 'Consultation'
    let discount: Int
}


// MARK: -Protocol consultation

protocol Consultation : Hashable {
    
    // MARK: - Properties
    
    ///  The service id of 'Consultation'
    var serviceId: Int { get }
    
    ///  The code of 'Consultation'
    var code: String { get }
    
    ///  The clinic id of 'Consultation'
    var clinicId: Int { get }
    
    ///  The price of 'Consultation'
    var price: Int { get }
    
    ///  The discount of 'Consultation'
    var discount: Int { get }
}
