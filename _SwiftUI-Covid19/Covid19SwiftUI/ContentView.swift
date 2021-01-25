//
//  ContentView.swift
//  Covid19SwiftUI
//
//  Created by Bao Vu on 4/7/20.
//  Copyright © 2020 Bao Vu. All rights reserved.
//

import SwiftUI

var country = ["USA","ITALY","SPAIN","AUSTRALIA","INDIA","ENGLAND","CHINA","VIETNAM","FRANCE","GERMANY"]

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct Home: View{
    
    @ObservedObject var data = getData()
    var body: some View{
        VStack{
            if self.data.countries.count != 0 && self.data.data != nil{
                VStack{
                    HStack(alignment: .top){
                        VStack(alignment: .leading, spacing: 15){
                            Text(getDate(time: self.data.data.updated))
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                            
                            Text("COVID - 19 Cases")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                            
                            Text(getValue(data: self.data.data.cases))
                                .fontWeight(.bold)
                                .font(.title)
                                .foregroundColor(.white)
                        }
                        Spacer()
                        Button(action: {
                            self.data.data = nil
                            self.data.countries.removeAll()
                            self.data.updateData()
                        }) {
                            Image(systemName: "arrow.clockwise")
                                .font(.title)
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 18)
                    .padding()
                    .padding(.bottom, 80)
                    .background(Color.red)
                    
                    HStack(spacing: 15){
                        VStack(alignment: .leading, spacing: 15){
                            Text("Deaths")
                                .foregroundColor(Color.black.opacity(0.5))
                            
                            Text(getValue(data: self.data.data.deaths))
                                .font(.title)
                                .fontWeight(.bold)
                            .foregroundColor(Color.red)
                        }.padding(.horizontal, 20)
                            .padding(.vertical, 30)
                            .background(Color.white)
                        .cornerRadius(12)
                        
                        VStack(alignment: .leading, spacing: 15){
                            Text("Recovered")
                                .foregroundColor(Color.black.opacity(0.5))
                            Text(getValue(data: self.data.data.recovered))
                                .font(.title)
                                .fontWeight(.bold)
                            .foregroundColor(Color.green)
                        }.padding(.horizontal, 20)
                            .padding(.vertical, 30)
                            .background(Color.white)
                        .cornerRadius(12)
                        
                    }
                    .offset(y: -60)
                    .padding(.bottom, -60)
                    .zIndex(25)
                    VStack(alignment: .center, spacing: 15){
                                       Text("Active Cases")
                                           .foregroundColor(Color.black.opacity(0.5))
                                       Text(getValue(data: self.data.data.active))
                                           .font(.title)
                                           .fontWeight(.bold)
                                       .foregroundColor(Color.yellow)
                                   }.padding(.horizontal, 20)
                                    .padding(.vertical, 30)
                                    .background(Color.white)
                                   .cornerRadius(12)
                        .padding(.top, 15)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15){
                            ForEach(self.data.countries,id: \.self){i in
                                cellView(data: i)
                            }
                        }.padding()
                    }
                }
            }else{
                GeometryReader{_ in
                    VStack{
                        Indicator()
                    }
                    
                }
            }
        }.edgesIgnoringSafeArea(.all)
            .background(Color.black.opacity(0.1).edgesIgnoringSafeArea(.all))
    }
}

struct cellView: View {
    
     var data: Details
    var body: some View{
        VStack(alignment: .leading, spacing: 15){
            Text(data.country)
                .fontWeight(.bold)
            HStack(spacing: 15){
                VStack(alignment: .leading, spacing: 12){
                    Text("Active Cases")
                        .font(.title)
                    Text(getValue(data: data.cases))
                        .font(.title)
                }
                VStack(alignment: .leading, spacing: 12){
                    VStack(alignment: .leading, spacing: 10){
                        Text("Deaths")
                        Text(getValue(data: data.deaths))
                            .foregroundColor(.red)
                    }
                    Divider()
                    VStack(alignment: .leading, spacing: 10){
                        Text("Recovered")
                        Text(getValue(data: data.recovered))
                            .foregroundColor(.green)
                    }
                    Divider()
                    VStack(alignment: .leading, spacing: 10){
                        Text("Critical")
                        Text(getValue(data: data.critical))
                            .foregroundColor(.yellow)
                    }
                    
                }
            }
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width - 30)
        .background(Color.white)
        .cornerRadius(20)
    }
}

struct Case : Codable{
    
    var cases: Double
    var deaths: Double
    var updated: Double
    var recovered: Double
    var active: Double
}

struct Details : Codable, Hashable{
    
    var country: String
    var cases: Double
    var deaths: Double
    var recovered: Double
    var critical: Double

}
public class getData: ObservableObject{
    
    @Published var data: Case!
    @Published var countries = [Details]()
    
    init(){
         updateData()
    }
    
    func updateData(){
        let urlAll = "https://corona.lmao.ninja/v2/all"
        let urlCountries = "https://corona.lmao.ninja/v2/countries/"
        let sessionAll = URLSession(configuration: .default)
        let sessionCountries = URLSession(configuration: .default)
        
        sessionAll.dataTask(with: URL(string: urlAll)!) { (data, response, error) in
            if error != nil {
                print("Error")
                return
            }
            do{
                let json = try JSONDecoder().decode(Case.self, from: data!)
                DispatchQueue.main.async {
                    self.data = json
                }
            }catch{
                print("Error")
            }
            
        }.resume()
        for i in country{
            sessionCountries.dataTask(with: URL(string: urlCountries+i)!) { (data, response, error) in
                if error != nil{
                    print("Error")
                    return
                }
                do{
                    let json = try JSONDecoder().decode(Details.self, from: data!)
                    DispatchQueue.main.async {
                        self.countries.append(json)
                    }
                }catch{
                    print("Error")
                }
            }.resume()
        }
    }
}

func getDate(time: Double) -> String {
    let date = Double(time / 1000)
    let format = DateFormatter()
    format.dateFormat = "MMM - dd - YYYY hh:mm a"
    return format.string(from: Date(timeIntervalSinceNow: TimeInterval(exactly: date)!))
}
func getValue(data: Double)-> String{
    let format = NumberFormatter()
    format.numberStyle = .decimal
    
    return format.string(for: data)!
}

struct Indicator : UIViewRepresentable{
    
    func makeUIView(context: UIViewRepresentableContext<Indicator>) -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView(style: .large)
        view.startAnimating()
        return view
    }
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<Indicator>) {
        
    }
}

