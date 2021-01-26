//
//  SearchViewTab.swift
//  DateMe
//
//  Created by Tony Hajdini on 12/01/2020.
//  Copyright © 2020 Tony Hajdini. All rights reserved.
//

import SwiftUI

struct SearchViewTab: View {
    
    @Binding var search: String
    @State var selectedPick = "Exercise"
    @State private var showingAlert = false

    func sortOutView() -> AnyView {
        switch selectedPick {
        case "Exercise":
            return AnyView(Excercise())
            case "Diet":
                return AnyView(Diet())
            case "Routes":
            return AnyView(Routes())
        default:
            return AnyView(Excercise())
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass").foregroundColor(Color.gray)
                TextField("Search \(selectedPick)", text: $search)
                }.padding(8)
                .overlay(RoundedRectangle(cornerRadius: 14).stroke(Color.gray, lineWidth: 1))
            .padding()
            Picker("Numbers", selection: $selectedPick) {
                Text("Exercise").tag("Exercise")
                Text("Diet").tag("Diet")
                    Text("Routes").tag("Routes")
                }.padding()
               .pickerStyle(SegmentedPickerStyle())
            sortOutView()
        }
    }
}

struct Diet: View {
    
    var body: some View {
        GridStack(rows: 4, columns: 2) { row, col in
            VStack(alignment: .leading) {
                Image("food10")
                    .resizable()
                    .cornerRadius(5)
                    .aspectRatio(contentMode: .fill)
                Text("R\(row) C\(col)")
            }
        }.padding(.horizontal)
    }
}

struct Excercise: View {
    var body: some View {
        List {
            ForEach(1...7, id: \.self) { ee in
                VStack(alignment: .leading) {
                Image("legs\(ee)").resizable()
                    .cornerRadius(20)
                    Text("Legs \(ee)")
                        .font(.headline)
                    Text("Legs \(ee)")
                        .font(.subheadline)
                }.frame(width: UIScreen.screenWidth, height: 300)
            }
        }
    }
}

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

// Route View
struct Routes: View {
    
    var body: some View {
    ScrollView {
        VStack(alignment: .leading) {
            MapView()
                .frame( width: UIScreen.screenWidth - 20,height: 200)
                .cornerRadius(5)
            HStack {
                Image(systemName: "mappin")
                Text("Coventry, England")
                }
            Text("4.5 km").font(.subheadline)
            }
        .shadow(radius: 5)
        VStack(alignment: .leading) {
                   MapView()
                       .frame( width: UIScreen.screenWidth - 20,height: 200)
                       .cornerRadius(5)
                   HStack {
                       Image(systemName: "mappin")
                       Text("Coventry, England")
                       }
                   Text("4.5 km").font(.subheadline)
                   }
               .shadow(radius: 5)
        VStack(alignment: .leading) {
                   MapView()
                       .frame( width: UIScreen.screenWidth - 20,height: 200)
                       .cornerRadius(5)
                   HStack {
                       Image(systemName: "mappin")
                       Text("Coventry, England")
                       }
                   Text("4.5 km").font(.subheadline)
                   }
               .shadow(radius: 5)
        }
    }
}


struct TabinView: View {
    
    let selectedPick: Int
    
    var body: some View {
        Text("\(self.selectedPick)")
    }
}

struct SearchViewTab_Previews: PreviewProvider {
    static var previews: some View {
        SearchViewTab(search: .constant(""), selectedPick: "Exercise")
    }
}
