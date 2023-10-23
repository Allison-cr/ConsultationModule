import SwiftUI

struct MainModuleView: View {
    @ObservedObject var coordinator: Coordinator
    @ObservedObject private var mainViewModel = MainViewModel()
    
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            VStack {
                FirstModule(
                    mainViewModel: mainViewModel,
                    selectedClinic: $mainViewModel.selectedClinic)
                Text("ID: \(mainViewModel.selectedClinic?.id ?? 0)")
                
                
            }
        }
    }
    
    
    
    
    private struct FirstModule: View {
        var mainViewModel: MainViewModel
        @State private var isClinicSheetPresented = false
        @Binding var selectedClinic: Clinic?
        

        var body: some View {
            VStack(alignment: .leading, spacing: 0) {
                HStack(spacing: 0) {
                    Image(systemName: "chevron.backward")
                        .padding(.trailing, 8)
                    Text("Купить консультации")
                        .font(.system(size: 16, weight: .medium))
                    Spacer()
                }
                .padding(.vertical, 16)
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color("back"))
                HStack(spacing: 0) {
                    Button(action: {
                        //
                    }) {
                        Text("По количеству")
                            .customStyle(textColor: .white, buttonColor: Color("button"))
                    }
                    Button(action: {
                        //
                    }) {
                        Text("По подписке")
                            .customStyle(textColor: Color("text-button"), buttonColor: .white)
                    }
                }
                .padding(.vertical, 16)
                Button(action: {
                    isClinicSheetPresented.toggle()
                }) {
                    HStack {
                        Text(selectedClinic?.clinicTitle ?? "Выбор клиники")
                            .foregroundColor(.black)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color("back-color"))
                            .font(.system(size: 24))
                    }
                }
                .sheet(isPresented: $isClinicSheetPresented) {
                    ClinicSelectionSheetView(
                        clinics: self.mainViewModel.clinicsViewModel.clinics,
                        selectedClinic: self.$selectedClinic,
                        isSheetPresented: self.$isClinicSheetPresented
                    )
                }


                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .background(Color.white)
                .cornerRadius(8)
                Text("Цена и врачи отличаются в зависимости от выбора клиники")
                    .padding(.top, 8)
                Spacer()
            }
            .padding(.horizontal, 16)
        }
    }
}
struct ClinicSelectionSheetView: View {
    var clinics: [Clinic]
    @Binding var selectedClinic: Clinic?
    @Binding var isSheetPresented: Bool
    @State private var searchText: String = ""
    @State private var selectedCity: String = ""

    // MARK: Search city/name
    var filteredClinics: [Clinic] {
        return clinics.filter { clinic in
            let isCityMatch = selectedCity.isEmpty || clinic.cityName == selectedCity
            let isSearchMatch = searchText.isEmpty || clinic.clinicTitle.lowercased().contains(searchText.lowercased())
            return isCityMatch && isSearchMatch
        }
    }
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text("Выберите клинику")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .bold))
                        .padding(.vertical, 16)
                    Spacer()
                    Button(action: {
                        isSheetPresented = false
                    }) {
                        Image(systemName: "multiply")
                            .font(.system(size: 24))
                            .foregroundColor(.gray)
                    }
                }
                .padding(.horizontal, 16)
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color("back"))
                    .padding(.bottom, 16)
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Поиск клиники", text: $searchText)
                        .font(.system(size: 16, weight: .bold))
                }
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(.white)
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
                Picker("Выберите город", selection: $selectedCity) {
                    Text("Все города").tag("")
                    ForEach(Array(Set(clinics.map { $0.cityName })), id: \.self) { city in
                        Text(city).tag(city)
                    }
                }
                .applyPickerStyle()

                ScrollView {
                    LazyVStack(spacing: 0) {
                        ForEach(filteredClinics, id: \.id) { clinic in
                            Button(action: {
                                selectedClinic = clinic
                                isSheetPresented = false
                            }) {
                                Text(clinic.clinicTitle)
                                    .applyLazyVStackStyle()
                            }
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }
}

struct CitySelectionView_Previews: PreviewProvider {
    static var previews: some View {
        CitySelectionView(mainViewModel: MainViewModel())
    }
}
struct Screen1SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MainModuleView(coordinator: Coordinator())
        
    }
}
struct CitySelectionView: View {
    @State private var selectedCityIndex = 0
    var mainViewModel: MainViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Picker("", selection: $selectedCityIndex) {
                ForEach(mainViewModel.clinicsViewModel.clinics) { clinic in
                    HStack{
                        Text(clinic.cityName)
                            .tag(clinic.id)
                    }
                }
            }
            .applyPickerStyle()
            
            
        }
    }
}

