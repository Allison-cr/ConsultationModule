import SwiftUI

// MARK: Main Module View

struct MainModuleView: View {
    
    // MARK: - Properties
    
    @ObservedObject var coordinator: Coordinator
    @ObservedObject private var mainViewModel = MainViewModel()
    
    
    // MARK: - View

    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    FirstModule(
                        mainViewModel: mainViewModel,
                        selectedClinic: $mainViewModel.selectedClinic
                    )
                    Cards(
                        mainViewModel: mainViewModel,
                        selectedClinic: $mainViewModel.selectedClinic,
                        selectedCard: $mainViewModel.selectedCard
                    )
                    VStack {
                        if mainViewModel.selectedCardIndex != nil {
                            TextInfo()
                            PayInfo()
                            if mainViewModel.selectedCardIndex != -1 {
                                CheckInfo(selectedCard: $mainViewModel.selectedCard)
                                NextView()
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                }
            }
        }
    }
    
    // MARK: - First Module

    private struct FirstModule: View {
        
        // MARK: - Properties

        var mainViewModel: MainViewModel
        @State private var isClinicSheetPresented = false
        @Binding var selectedClinic: Clinic?
        
        // MARK: - View
    
        var body: some View {
            VStack(alignment: .leading, spacing: 0) {
                HStack(spacing: 0) {
                    Image(systemName: "chevron.backward")
                        .padding(.trailing, 8)
                    Text("Купить консультации")
                        .font(.system(size: 16, weight: .medium))
                    Spacer()
                }
                .padding(16)
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color("back"))
                VStack(alignment: .leading, spacing: 0) {
                    
                    HStack(spacing: 0) {
                        Button(action: {
                            mainViewModel.selectByAmount()
                        }) {
                            Text("По количеству")
                                .customStyle(textColor: mainViewModel.selectedBuyMode ?  Color("text-button") : .white,
                                             buttonColor: mainViewModel.selectedBuyMode ? .white : Color("button"))
                        }
                        Button(action: {
                            mainViewModel.selectByPeriod()
                        }) {
                            Text("По подписке")
                                .customStyle(textColor: mainViewModel.selectedBuyMode ? .white : Color("text-button"),
                                             buttonColor: mainViewModel.selectedBuyMode ? Color("button") : .white )
                        }
                    }
                    .padding(.vertical, 16)
                    Button(action: {
                        isClinicSheetPresented.toggle()
                    }) {
                        Text(selectedClinic?.clinicTitle ?? "Выбор клиники")
                            .foregroundColor(.black)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color("back-color"))
                            .font(.system(size: 24))
                    }
                    .sheet(isPresented: $isClinicSheetPresented) {
                        ClinicSelectionSheetView(
                            mainViewModel: mainViewModel,
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
}

// MARK: - Previews

struct MainModuleView_Previews: PreviewProvider {
    static var previews: some View {
        MainModuleView(coordinator: Coordinator())
    }
}

// MARK: - Clinic Selection Sheet View

struct ClinicSelectionSheetView: View {
    
    // MARK: - Properties

    var mainViewModel: MainViewModel
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
    
    // MARK: - View

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
                                mainViewModel.selectedCardIndex = -1
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

// MARK: - City Selection View

struct CitySelectionView: View {
    
    // MARK: - Properties

    @State private var selectedCityIndex = 0
    var mainViewModel: MainViewModel

    // MARK: - View

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

// MARK: - Cards

struct Cards: View {
    
    // MARK: - Properties

    var mainViewModel: MainViewModel
    
    @Binding var selectedClinic: Clinic?
    @Binding  var selectedCard: (any Consultation)?
    
    // MARK : fake protocol
    
    var filteredClinics: [any Consultation] = []

    // MARK : Initializing arrays of buy mode
    
    init(mainViewModel: MainViewModel, selectedClinic: Binding<Clinic?>, selectedCard: Binding<(any Consultation)?>) {
        self.mainViewModel = mainViewModel
        self._selectedClinic = selectedClinic
        self._selectedCard = selectedCard

        if mainViewModel.selectedBuyMode {
            filteredClinics = mainViewModel.consultationViewModel.consultationsByPeriod.filter { $0.clinicId == mainViewModel.selectedClinic?.id }
        } else {
            filteredClinics = mainViewModel.consultationViewModel.consultationsByAmount.filter { $0.clinicId == mainViewModel.selectedClinic?.id }
        }
    }

    // MARK : View

    var body: some View {
        VStack {
            LazyVGrid(columns: [
                GridItem(.flexible(minimum: 100, maximum: .infinity), spacing: 16),
                GridItem(.flexible(minimum: 100, maximum: .infinity), spacing: 16)
            ], spacing: 64) {
                ForEach(filteredClinics.indices, id: \.self) { index in
                    GeometryReader { geometry in
                        VStack {
                            CustomCards(
                                price: filteredClinics[index].price,
                                discount: filteredClinics[index].discount,
                                amount: (filteredClinics[index] as? ConsultationByAmount)?.amount,
                                periodMonths: (filteredClinics[index] as? ConsultationByPeriod)?.periodMonths
                            )
                        }
                        .padding(16)
                        .frame(width: geometry.size.width, height: 70)
                        .background(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(mainViewModel.selectedCardIndex == index ? Color("button") : Color.clear, lineWidth: 2)
                        )
                        .cornerRadius(8)
                        .onTapGesture {
                            mainViewModel.selectedCardIndex = index
                            mainViewModel.selectedCard = filteredClinics[index]
                        }
                    }
                    .padding(.bottom, 8)
                }
            }
           
        }
        .padding(.horizontal, 16)
    }
}

// MARK : Text Info

struct TextInfo: View {
    
    // MARK : View

    var body: some View {
        VStack {
            CustomText(infoType: .first)
            CustomText(infoType: .second)
        }
        .padding(.top, 64)
    }
}

// MARK : Pay Info

struct PayInfo: View {
    
    // MARK : Properties

    @State private var selectedPayType: PayType?

    // MARK : View

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Способ оплаты")
                .font(.system(size: 16, weight: .bold))
                .padding(.top, 8)
                .padding(.bottom, 16)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    EmptyCard()
                    ForEach(PayType.allCases, id: \.self) { payType in
                        CustomPayCards(
                            payType: payType,
                            isSelected: payType == selectedPayType,
                            onTap: {
                                selectedPayType = payType
                            }
                        )
                    }
                }
            }
        }
    }
}

// MARK : Check Info

struct CheckInfo: View {
    
    // MARK : Properties

    @Binding var selectedCard: (any Consultation)?

    
    // MARK : View

    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text("Ваш заказ")
                    .font(.system(size: 16, weight: .bold))
                Spacer()
            }
            if let card = selectedCard {
                if let amount = (card as? ConsultationByAmount)?.amount {
                    CheckPayVarible(price: card.price, discount: card.discount, amount: amount, periodMonths: nil)
                } else if let periodMonth = (card as? ConsultationByPeriod)?.periodMonths {
                    CheckPayVarible(price: card.price, discount: card.discount, amount: nil, periodMonths: periodMonth)
                }
            }
        }
    }
}


// MARK : Button to next view

struct NextView: View {
    
    // MARK : View

    var body: some View {
        VStack {
            Button(action: {
                //
            }) {
                HStack {
                    Spacer()
                    Text("Продолжить")
                        .foregroundColor(.white)
                        .font(.system(size: 16,weight: .bold))
                    Spacer()
                }
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(Color("button"))
            .cornerRadius(8)
            .padding(.horizontal, 16)
            .padding(.top, 32)
        }
    }
}
