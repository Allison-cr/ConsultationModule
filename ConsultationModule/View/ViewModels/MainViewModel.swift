import Foundation

class MainViewModel: ObservableObject {
    @Published var doctorsViewModel: DoctorsViewModel = DoctorsViewModel()
    @Published var consultationViewModel: ConsultationViewModel = ConsultationViewModel()
    @Published var clinicsViewModel: ClinicsViewModel = ClinicsViewModel()

    @Published var consultationClinicData: ConsultationClinicData?
    @Published var selectedClinic: Clinic?
    @Published var isSheetPresented = false
    @Published var filteredClinics: [Clinic] = []
    @Published var searchText: String = ""
    @Published var selectedCity: String = ""
    @Published var selectedBuyMode = false
    @Published var selectedCardIndex: Int?
    @Published var selectedMode: BuyMode = .byAmount
    @Published var selectedCard: (any Consultation)? 



    func selectByAmount() {
        selectedBuyMode = false
        selectedMode = .byAmount
        selectedCardIndex = -1
    }
    func selectByPeriod() {
        selectedBuyMode = true
        selectedMode = .bySubscription
        selectedCardIndex = -1
    }
    

    init() {
        doctorsViewModel.loadDoctors()
        consultationViewModel.loadConsultations()
        clinicsViewModel.loadClinics()
    }
}
