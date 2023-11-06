import SwiftUI
//
//struct Cards: View {
//    var mainViewModel: MainViewModel
//    @Binding var selectedClinic: Clinic?
//    var filteredClinics: [any Consultation] = [] 
//
//    init(mainViewModel: MainViewModel, selectedClinic: Binding<Clinic?>) {
//        self.mainViewModel = mainViewModel
//        self._selectedClinic = selectedClinic
//        if mainViewModel.selectedBuyMode {
//            filteredClinics = mainViewModel.consultationViewModel.consultationsByPeriod.filter { $0.clinicId == mainViewModel.selectedClinic?.id }
//        } else {
//            filteredClinics = mainViewModel.consultationViewModel.consultationsByAmount.filter { $0.clinicId == mainViewModel.selectedClinic?.id }
//        }
//    }
//
//    var body: some View {
//        VStack {
//            LazyVGrid(columns: [
//                GridItem(.flexible(minimum: 100, maximum: .infinity), spacing: 16),
//                GridItem(.flexible(minimum: 100, maximum: .infinity), spacing: 16)
//            ], spacing: 64) {
//                ForEach(filteredClinics.indices, id: \.self) { index in
//                    GeometryReader { geometry in
//                        VStack {
//                            CustomCards(
//                                price: filteredClinics[index].price,
//                                discount: filteredClinics[index].discount,
//                                amount: (filteredClinics[index] as? ConsultationByAmount)?.amount,
//                                periodMonths: (filteredClinics[index] as? ConsultationByPeriod)?.periodMonths
//                            )
//                        }
//                        .padding(16)
//                        .frame(width: geometry.size.width, height: 70)
//                        .background(Color.white)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 8)
//                                .stroke(mainViewModel.selectedCardIndex == index ? Color("button") : Color.clear, lineWidth: 2)
//                        )
//                        .cornerRadius(8)
//                        .onTapGesture {
//                            mainViewModel.selectedCardIndex = index
//                        }
//                    }
//                    .padding(.bottom, 8)
//                }
//            }
//            if mainViewModel.selectedCardIndex != nil {
//                Group {
//                    TextInfo()
//                    PayInfo()
//                }
//            }
//        }
//        .padding(.horizontal, 16)
//    }
//}
