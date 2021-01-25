import SwiftUI

struct ValidationView: View {
    static let tag: String? = "Validation"
    @State private var numberVAT = ""
    @State private var numberFormatVAT = ""
    @State private var showingSheet = false
    @State private var response = Response(valid: false, vatNumber: "", name: "", address: "", countryCode: "")
    @State private var selectedCountry = Country.austria
    var countries: [Country]
    
    var body: some View {
        NavigationView {
            Form {
                Picker(selection: $selectedCountry, label: Text("Member State")) {
                    ForEach(countries, id: \.self) { country in
                        Text(country.name)
                    }
                }
                
                Section(header: Text("VAT Number")) {
                    HStack {
                        Text(selectedCountry.countryCode)
                        TextField("\(numberFormatVAT)", text: $numberVAT)
                            .disableAutocorrection(true)
                            .keyboardType(.numberPad)

                    }
                }

                Button(action: {validateVAT("\(selectedCountry.countryCode)"+"\(numberVAT)")}) {
                    Text("Verify")
                }
                .disabled(checkInput())
            }
            .navigationBarTitle("VAT Validation")
        }
        .sheet(isPresented: $showingSheet) {
            ValidationSheetView(response: response)
        }
    }

    func checkInput() -> Bool {
        // TODO: Input must be Integer
        var baseRule: Bool {
            if numberVAT.isEmpty || numberVAT.contains(" ") || numberVAT.count > 12 {
                return true
            } else {
                return false
            }
        }

        switch selectedCountry {
            case .austria:
                if baseRule || numberVAT.first != "U"  || numberVAT.count != 9 {
                    return true
                } else {
                    return false
                }
            // Prefix with zero ‘0’ if the customer provides a 9 digit VAT number ZA CASE 1.
            case .belgium, .bulgaria:
                if baseRule || numberVAT.count != 10 && numberVAT.count != 9 {
                    return true
                } else {
                    return false
                }
            case .croatia, .italy, .latvia:
                if baseRule || numberVAT.count != 11 {
                    return true
                } else {
                    return false
                }
            case .cyprus:
                if baseRule || numberVAT.count != 9 || ((numberVAT.last?.isLetter) != true) {
                    return true
                } else {
                    return false
                }
            case .czechia:
                if baseRule || numberVAT.count != 10 && numberVAT.count != 9 && numberVAT.count != 8 {
                    return true
                } else {
                    return false
                }
            case .denmark, .finland, .hungary, .luxembourg, .malta, .slovenia :
                if baseRule || numberVAT.count != 8 {
                    return true
                } else {
                    return false
                }
            case .estonia, .germany, .greece, .portugal, .spain:
                if baseRule || numberVAT.count != 9 {
                    return true
                } else {
                    return false
                }
            case .poland, .slovakia:
                if baseRule || numberVAT.count != 10 {
                    return true
                } else {
                    return false
                }
            case .romania:
                if baseRule || numberVAT.count > 10 || numberVAT.count < 2 {
                    return true
                } else {
                    return false
                }
            case .lithuania:
                if baseRule || numberVAT.count != 12 && numberVAT.count != 9 {
                    return true
                } else {
                    return false
                }

            // 11 characters. May include alphabetical characters (any except O or I) as first or second or first and second characters.
            case .france:
                if baseRule || numberVAT.count != 11 {
                    return true
                } else {
                    return false
                }

            // 8 or 9 characters. Includes one or two alphabetical characters (last, or second and last, or last 2).
            case .ireland:
                if baseRule || numberVAT.count != 9 && numberVAT.count != 8 {
                    return true
                } else {
                    return false
                }

            // 12 characters. The tenth character is always B.
            case .netherlands:
                if baseRule || numberVAT.count != 12 {
                    return true
                } else {
                    return false
                }

            default:
                if baseRule || numberVAT.count != 12 {
                    return true
                } else {
                    return false
                }
        } //: SWITCH
    }

    func validateVAT(_ VAT: String) {
        let semaphore = DispatchSemaphore(value: 0)
        let url: URL? = URL(string: "https://api.vatcomply.com/vat?vat_number=\(VAT)")
        var request = URLRequest(url: (url ?? URL(string: "https://api.vatcomply.com/vat?vat_number="))!)
        request.addValue("__cfduid=db6f000a97f4db915610c6c2043af38c11608235266", forHTTPHeaderField: "Cookie")

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                semaphore.signal()
                return
            }
            let decodedResponse = try? JSONDecoder().decode(Response.self, from: data)
            self.response = decodedResponse ?? Response(valid: false, vatNumber: "\(numberVAT)", name: "N/A", address: "N/A", countryCode: selectedCountry.countryCode)
            print(String(data: data, encoding: .utf8)!)
            semaphore.signal()
        }

        task.resume()
        semaphore.wait()

        showingSheet = true
    }
}

struct ValidationView_Previews: PreviewProvider {
    static var previews: some View {
        ValidationView(countries: Country.all)
    }
}
