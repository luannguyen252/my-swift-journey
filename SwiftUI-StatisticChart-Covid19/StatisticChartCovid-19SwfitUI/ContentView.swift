import SwiftUI

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

// Home
struct Home: View {
    @State var index = 0
    @State var main: MainData!
    @State var daily: [Daily] = []
    @State var last: Int = 0
    
    var body: some View {
        VStack {
            if self.main != nil && !self.daily.isEmpty {
                VStack {
                    VStack(spacing: 16) {
                        HStack {
                            Text("Covid-19")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Button(action: {
                                print("Country Pressed.")
                            }) {
                                Text("Country")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                        }
                        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                        
                        // This is a Tab view which includes a My Country view and a Global view
                        HStack {
                            Button(action: {
                                self.index = 0
                                self.main = nil
                                self.daily.removeAll()
                                self.getData()
                            }) {
                                Text("My Country")
                                    .foregroundColor(self.index == 0 ? .black : .white)
                                    .padding(.vertical, 12)
                                    .frame(width: (UIScreen.main.bounds.width / 2) - 30)
                            }
                            .background(self.index == 0 ? Color.white : Color.clear)
                            .clipShape(Capsule())
                            
                            Button(action: {
                                self.index = 1
                                self.main = nil
                                self.daily.removeAll()
                                self.getData()
                            }) {
                                Text("Global")
                                    .foregroundColor(self.index == 1 ? .black : .white)
                                    .padding(.vertical, 12)
                                    .frame(width: (UIScreen.main.bounds.width / 2) - 30)
                            }
                            .background(self.index == 1 ? Color.white : Color.clear)
                            .clipShape(Capsule())
                        }
                        .background(Color.black.opacity(0.25))
                        .clipShape(Capsule())
                        
                        // This is an Affected and Death
                        HStack(spacing: 20) {
                            // This is an Affected
                            VStack {
                                Text("Affected")
                                Text("\(self.main.cases)")
                            }
                            .padding(.vertical, 12)
                            .frame(width: (UIScreen.main.bounds.width / 2) - 30)
                            .foregroundColor(.white)
                            .background(Color("affected"))
                            .cornerRadius(15)
                            
                            // This is a Death
                            VStack {
                                Text("Death")
                                Text("\(self.main.deaths)")
                            }
                            .padding(.vertical, 12)
                            .frame(width: (UIScreen.main.bounds.width / 2) - 30)
                            .foregroundColor(.white)
                            .background(Color("death"))
                            .cornerRadius(15)
                        }.padding()
                        
                        // This is a Recovered, an Active and a Serious...
                        
                        HStack(spacing: 20) {
                            // This is a Recovered
                            VStack {
                                Text("Recovered")
                                Text("\(self.main.recovered)")
                            }
                            .padding(.vertical, 12)
                            .frame(width: (UIScreen.main.bounds.width / 3) - 30)
                            .foregroundColor(.white)
                            .background(Color("recovered"))
                            .cornerRadius(15)
                            
                            // This is an Active
                            VStack {
                                Text("Active")
                                Text("\(self.main.active)")
                            }
                            .padding(.vertical, 12)
                            .frame(width: (UIScreen.main.bounds.width / 3) - 30)
                            .foregroundColor(.white)
                            .background(Color("active"))
                            .cornerRadius(15)
                            
                            // This is a Serious
                            VStack{
                                Text("Serious")
                                Text("\(self.main.critical)")
                            }
                            .padding(.vertical, 12)
                            .frame(width: (UIScreen.main.bounds.width / 3) - 30)
                            .foregroundColor(.white)
                            .background(Color("serious"))
                            .cornerRadius(15)
                        }
                        .padding(.top, -20)
                        .padding()
                    }
                    .padding()
                    .padding(.bottom, 45)
                    .background(Color("bg"))
                    .edgesIgnoringSafeArea(.top)
                    
                    VStack {
                        HStack {
                            Text("Last 7 Days")
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                            Spacer()
                        }
                        .padding()
                        
                        // This is a 7 columns
                        HStack(spacing: 10) {
                            ForEach(self.daily) { i in
                                VStack(spacing: 10) {
                                    Text("\(i.cases / 1000)K")
                                        .lineLimit(1)
                                        .foregroundColor(Color.black.opacity(0.25))
                                    GeometryReader { g in
                                        Rectangle()
                                            .fill(Color.red)
                                            .frame(width: 15, height: self.getHeight(value: i.cases, height: g.frame(in: .global).height))
                                    }
                                    
                                    Text("i.day")
                                        .lineLimit(1)
                                        .font(.footnote)
                                        .foregroundColor(Color.black.opacity(0.25))
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                    .background(Color.white)
                    .cornerRadius(40)
                    .padding(.bottom, -40)
                    .offset(y: -100)
                }
            } else {
                Indicator()
            }
        }
        .onAppear {
            self.getData()
        }
    }
    
    // Get Data
    func getData() {
        // This url is for My Country or Global
        var url = ""
        
        if self.index == 0 {
            url = "https://disease.sh/v3/covid-19/countries/usa?yesterday=false"
        } else if self.index == 1 {
            url = "https://disease.sh/v3/covid-19/all?yesterday=false"
        }
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!) { (data, response, error) in
            if error != nil {
                print("Error")
                return
            }
            do {
                let json = try JSONDecoder().decode(MainData.self, from: data!)
                DispatchQueue.main.async {
                    self.main = json
                }
            } catch {
                print("Error")
            }
        }.resume()
        
        // This urltimeline is for My Country or Global
        var urlTimeline = ""
        
        if self.index == 0 {
            urlTimeline = "https://disease.sh/v3/covid-19/historical/usa?lastdays=7"
        } else if self.index == 1 {
            urlTimeline = "https://disease.sh/v3/covid-19/historical/all?lastdays=7"
        }
        let sessionTimeLine = URLSession(configuration: .default)
        
        sessionTimeLine.dataTask(with: URL(string: urlTimeline)!) { (data, response, error) in
            if error != nil {
                print("error")
                return
            }
            
            var count = 0
            var cases : [String: Int] = [:]
            
            if self.index == 0 {
                do {
                    let json = try JSONDecoder().decode(MyCountry.self, from: data!)
                    DispatchQueue.main.async {
                        cases = json.timeline["cases"]!
                    }
                } catch {
                    print("Error")
                }
            } else if self.index == 1 {
                do {
                    let json = try JSONDecoder().decode(Global.self, from: data!)
                    DispatchQueue.main.async {
                        cases = json.cases
                    }
                } catch {
                    print("Error")
                }
            }
            
            for i in cases {
                self.daily.append(Daily(id: count, day: i.key, cases: i.value))
                count += 1
            }
           // self.last = self.daily.last!.cases
        }
        .resume()
    }
    
    // Get heights of columns
    func getHeight(value: Int, height: CGFloat) -> CGFloat {
        return 0
    }
}

// This is the Data Models for JSON Parsing
struct Daily: Identifiable {
    var id: Int
    var day: String
    var cases: Int
}

struct MainData: Decodable {
    var deaths: Int
    var recovered: Int
    var active: Int
    var critical: Int
    var cases: Int
}

struct MyCountry: Decodable {
    var timeline: [String: [String : Int]]
}

struct Global: Decodable {
    var cases: [String : Int]
}

// Create UIView
struct Indicator: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView(style: .large)
        view.startAnimating()
        return view
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        
    }
}
