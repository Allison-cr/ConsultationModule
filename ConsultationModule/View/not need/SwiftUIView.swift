//import SwiftUI
//struct Swiftui: View {
//    @ObservedObject var coordinator: Coordinator
//    @ObservedObject private var mainViewModel = MainViewModel()
//    @ObservedObject private var consultationViewModel = ConsultationViewModel()
//
//    // Передайте модель данных в представление
//    var data: YourDataModel
//
//    var body: some View {
//        ZStack {
//            Color("background")
//                .ignoresSafeArea()
//
//            List {
//                ForEach(data.clinics) { clinic in
//                    Section(header: Text("Clinic ID: \(clinic.clinicId)")) {
//                        ForEach(clinic.consultationsByAmount, id: \.serviceId) { consultation in
//                            Text("Service ID: \(consultation.serviceId), Price: \(consultation.price)")
//                        }
//                        ForEach(clinic.consultationsByPeriod, id: \.serviceId) { consultation in
//                            Text("Service ID: \(consultation.serviceId), Price: \(consultation.price)")
//                        }
//                    }
//                }
//            }
//        }
//    }
//}
//
//struct SwiftuiView_Previews: PreviewProvider {
//    static var previews: some View {
//        // Создайте модель данных и передайте ее в представление
//        Swiftui(coordinator: Coordinator(), data: yourDataModel)
//    }
//}
