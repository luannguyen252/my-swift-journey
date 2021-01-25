import SwiftUI

struct CountryRateDetailView: View {
    var country: Country
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(country.name)
                .font(.largeTitle)
                .fontWeight(.black)
                .padding(.leading)
            Group {
                HStack {
                    Text("Country Code:")
                    Text("\(country.countryCode)")
                    .fontWeight(.bold)
                }
                
                HStack {
                    Text("Standard Rate:")
                    Text("\(country.standardRate, specifier: "%.2f")")
                    .fontWeight(.bold)
                }
                
                HStack {
                    Text("Reduced Rate:")
                    ForEach(country.reducedRate, id: \.self) { value in
                        Text("\(value, specifier: "%.2f")")
                            .fontWeight(.bold)
                    }
                }
                
                HStack {
                    Text("Super Reduced Rate:")
                    Text("\(country.superReducedRate, specifier: "%.2f")")
                        .fontWeight(.bold)
                }
                
                HStack {
                    Text("Parking Rate:")
                    Text("\(country.parkingRate, specifier: "%.2f")")
                        .fontWeight(.bold)
                }
            }
            .font(.body)
            .padding(.leading)

            MapView(country: country)
        }
    }
}

struct CountryRateDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryRateDetailView(country: Country.austria)
    }
}
