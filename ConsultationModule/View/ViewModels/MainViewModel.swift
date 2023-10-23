import Foundation

class MainViewModel: ObservableObject {
    @Published var doctorsViewModel: DoctorsViewModel = DoctorsViewModel()
    @Published var consultationViewModel: ConsultationViewModel = ConsultationViewModel()
    @Published var clinicsViewModel: ClinicsViewModel = ClinicsViewModel()

    
    @Published var selectedClinic: Clinic?
    @Published var isSheetPresented = false
    @Published var filteredClinics: [Clinic] = []
    @Published var searchText: String = ""
    @Published var selectedCity: String = ""
    @Published var selectedClinicConsultations: [Consultation] = []



    

    init() {
        doctorsViewModel.loadDoctors()
        consultationViewModel.loadConsultations()
        clinicsViewModel.loadClinics()
    }
}
