import SwiftUI

struct CountryRatesListView: View {
    static let tag: String? = "Rates"
    var countries: [Country]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(countries, id: \.name) { country in
                    NavigationLink(destination: CountryRateDetailView(country: country)) {
                        Text(country.name)
                    }
                }
            }
            .navigationBarTitle("VAT Rates")
        }
    }
}

struct CountryRatesListView_Previews: PreviewProvider {
    static var previews: some View {
        CountryRatesListView(countries: Country.all)
    }
}
