//
//  ContentView.swift
//  Salome
//
//  Created by App Designer2 on 15.08.20.
//

import SwiftUI
import Combine
import NaturalLanguage
import CoreML

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Nael.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Nael.biografie, ascending: true),
        NSSortDescriptor(keyPath: \Nael.name, ascending: true),
        NSSortDescriptor(keyPath: \Nael.photo, ascending: true),
        NSSortDescriptor(keyPath: \Nael.rating, ascending: false),
        NSSortDescriptor(keyPath: \Nael.url, ascending: true),
        NSSortDescriptor(keyPath: \Nael.profile, ascending: true),
        NSSortDescriptor(keyPath: \Nael.date, ascending: false)])
    var saly : FetchedResults<Nael>
    
    @State var photos : Data = .init(count: 0)
    @State var profile : Data = .init(count: 0)
    
    @State var showPicker = false
    
    var columns = Array(repeating: GridItem(.fixed(95), spacing: 25), count: 3)
    
    static var dateFormatter : DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        //formatter.dateFormat = "hh:mm a"
        
        return formatter
    }()
    var date = Date()
    
    //@ObservedObject var mainPic = Nael()
    
    //var rows = Array(repeating: GridItem(.flexible(), spacing: 10), count: 1)
    @State var time = Timer.publish(every: 0.10, on: .main, in: .common).autoconnect()
    
    func blurse(blurs : Bool) -> Bool  {
        blurs ? true : false
    }
    
    func count(counts : Int) -> Int {
        (counts != 0) ? 2 : 3
    }
    @AppStorage("searchs") var searchs = false
    
    @State var search = ""
    
    @State var scroll = false
    
    /*@ObservedObject var register = LoginSignUp()
    
    func signOut(email: String,pass: String) {
        self.register.email.append(email)
    }*/
    
    @ObservedObject public var chooce = SchemeMode()
    
    //@Namespace var detail
    
    @ObservedObject var detail = NameSpace()
    
    @State var img : Data = .init(count: 0)
    
    
    /*@State var colors = false
    func colorScheme(color: ColorScheme) -> ColorScheme {
        self.colors ? .light : .dark
        
    }*/
    @AppStorage("profileIcon") var profileIcon : Data = .init(count: 0)
    @State public var iconPicker : Bool = false
    
    //-------------------------------------------------
    @State var device = UIDevice.BatteryState.unplugged
    //-------------------------------------------------
    
    //-----------------------------------------
    //@State private var translate : NLLanguage = .german
    
    @ObservedObject var detectLanguage = DetectLanguage()
    
    @State var language : String = ""
    /*@State var idioma = ""*/
    //-----------------------------------------
    
    //-----------------------------------------
    @State private var translater : Bool = false
    //-----------------------------------------
    
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .fill(self.chooce.chooce ? Color.init(#colorLiteral(red: 0.8705882353, green: 0.9176470588, blue: 0.9647058824, alpha: 1)) : Color.init(#colorLiteral(red: 0.1019607843, green: 0.1058823529, blue: 0.1176470588, alpha: 1)))
                    .edgesIgnoringSafeArea(.all)
                 
                
               ScrollView(.vertical, showsIndicators: self.scroll) {
                    
                    //------------------UISearch-------------Start-
                    withAnimation(Animation.easeInOut.speed(0.1)) {
            ZStack {
                
                if self.searchs {
                    
                        
                TextField(self.saly.isEmpty ? "Add people to search here...": "Search people...", text: self.$search)
                    .padding(10)
                    .background(self.chooce.chooce ? Color.init(#colorLiteral(red: 0.8705882353, green: 0.9176470588, blue: 0.9647058824, alpha: 1)) : Color.init(#colorLiteral(red: 0.1019607843, green: 0.1058823529, blue: 0.1176470588, alpha: 1)))
                    .cornerRadius(20)
                    // Start lightShadow
                    .shadow(color: self.chooce.chooce ? Color.init(#colorLiteral(red: 0.9529411765, green: 0.9764705882, blue: 1, alpha: 1)) : Color.init(#colorLiteral(red: 0.1411764706, green: 0.1450980392, blue: 0.1607843137, alpha: 1)),radius: 5, x: -5, y: -5)
                    // End lightShadow
                    
                    // Start darkShadow
                    .shadow(color: self.chooce.chooce ? Color.init(#colorLiteral(red: 0.7450980392, green: 0.7960784314, blue: 0.8470588235, alpha: 1)) : Color.init(#colorLiteral(red: 0.08235294118, green: 0.08235294118, blue: 0.09411764706, alpha: 1)),radius: 5, x: 5, y: 5)
                    // End darkShadow
                    
                    //.aspectRatio(contentMode: self.searchs ? .fill : .fit)
                    .transition(.scale(scale: self.searchs ? 0 : 130))
                    
                    
                } else {}
                if self.search.isEmpty == false {
                Button(action: {
                    self.search = ""
                    
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }.position(x: 315, y: 20)
                } else {}
            }.padding()
            
            }.animation(Animation.easeInOut.delay(0.1).speed(0.1))
            //------------------UISearch-------------End--------
                    
            ZStack {
                //If there are not items added, 
                if saly.count != 0 {
                    
                LazyVGrid(columns: columns, spacing: 25) {
                    
                    ForEach(saly.filter({ self.search.isEmpty ? true : $0.name!.localizedCaseInsensitiveContains(self.search)}), id: \.self) { nael in
                        //HStack(alignment: .top) {
                        withAnimation(Animation.easeInOut.speed(0.1)) {
                            NavigationLink(destination: DetailView(detail: nael)) {
                                
                                VStack {
                            Image(uiImage: UIImage(data: nael.profile ?? self.profile)!)
                                .renderingMode(.original)
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 95,height: 95)
                                
                                .overlay(Circle().stroke(self.chooce.chooce ? Color.init(#colorLiteral(red: 0.9529411765, green: 0.9764705882, blue: 1, alpha: 1)) : Color.init(#colorLiteral(red: 0.1411764706, green: 0.1450980392, blue: 0.1607843137, alpha: 1)), lineWidth: 3))
                                
                                .shadow(color: self.chooce.chooce ? Color.init(#colorLiteral(red: 0.9529411765, green: 0.9764705882, blue: 1, alpha: 1)) : Color.init(#colorLiteral(red: 0.1411764706, green: 0.1450980392, blue: 0.1607843137, alpha: 1)),radius: 10, x: -10, y: -10)
                                
                                .shadow(color: self.chooce.chooce ? Color.init(#colorLiteral(red: 0.7450980392, green: 0.7960784314, blue: 0.8470588235, alpha: 1)) : Color.init(#colorLiteral(red: 0.08235294118, green: 0.08235294118, blue: 0.09411764706, alpha: 1)),radius: 10, x: 10, y: 10)
                                
                                    //Text("\(saly.startIndex)")
                                    withAnimation(Animation.easeIn.speed(0.1)) {
                                    Text("\(self.detectLanguage.detectLanguage(idioma: nael.biografie!)!)")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }.animation(Animation.easeIn.delay(0.3).speed(0.1))
                                    
                                }
                                
                                //.offset(x: -0, y: 130)
                            
                            /*VStack(alignment: .leading) {
                                Text("\(nael.name!)")
                                    .font(.headline)
                                
                                Text("\(nael.date ?? self.date, formatter: Self.dateFormatter)")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                
                            }*/
                             
                            }.isDetailLink(false) //NvgtLink
                        }.animation(Animation.easeInOut.delay(0.1).speed(0.1))
                        }//.onDelete(perform: delete)
                    
                    //Foreach
                        
                }//LazyVGrid
            
                }  else {
                    //This will be displaying when there are not items added
                    HStack {
                        Text("🥺 is empty...").foregroundColor(.secondary)
                    Indicator()
                        
                    }.shadow(color: self.chooce.chooce ? Color.init(#colorLiteral(red: 0.9529411765, green: 0.9764705882, blue: 1, alpha: 1)) : Color.init(#colorLiteral(red: 0.1411764706, green: 0.1450980392, blue: 0.1607843137, alpha: 1)),radius: 5, x: -5, y: -5)
                    
                    .shadow(color: self.chooce.chooce ? Color.init(#colorLiteral(red: 0.7450980392, green: 0.7960784314, blue: 0.8470588235, alpha: 1)) : Color.init(#colorLiteral(red: 0.08235294118, green: 0.08235294118, blue: 0.09411764706, alpha: 1)),radius: 5, x: 5, y: 5)
                    
                }
           } //ZStack
                //}Lazy
           } //ScrollView //.padding()
                
            .navigationBarTitle(Text("People"), displayMode: .automatic)
                .navigationBarItems(leading:
                Button(action: {
                 self.searchs.toggle()
                    self.search = ""
                }) {
                 Image(systemName: "magnifyingglass")
                    .font(.system(size: 25))
                    .foregroundColor(self.chooce.chooce ? .black : .gray)
                    
                },trailing: HStack(spacing: 10) { Button(action: {
                    //self.showPicker.toggle()
                }) {
                    Image(systemName: "line.horizontal.3.decrease")
                        .font(.system(size: 25))
                        .foregroundColor(self.chooce.chooce ? .black : .gray)
                }.sheet(isPresented: self.$iconPicker) {
                    ImagePicker(show: self.$iconPicker, image: self.$profileIcon)
                }
                 
                //-----ContextMenu----Start---
                    .contextMenu {
                        
                     Button(action: {
                                
                      self.showPicker.toggle()}) {
                        
                         HStack {
                             Text("Add new")
                             Image(systemName: "plus.circle.fill")}}
                        
                        
                            Button(action: {
                                    
                                self.chooce.chooce.toggle()}) {
                                
                                HStack {
                                    Text(self.chooce.chooce ? "LightMode" : "DarkMode")
                                    Image(systemName: self.chooce.chooce ? "sun.max.fill" : "moon.stars.fill")}}
                        
                        Button(action: {
                                //Translate
                            self.translater.toggle()
                            if let prediction = self.detectLanguage.detectLanguage(idioma: self.language) {
                                print(prediction)
                                self.language = prediction
                            }
                        }) {
                           
                            HStack {
                                Text(self.translater ? "Spanish": "German")
                                
                                Image(systemName: "translate")}
                            
                           
                                Button(action: {
                                    
                                }) {
                                    HStack {
                                    Text("Edit")
                                    Image(systemName: "pencil.circle")
                                }
                                
                            }
                        }
                            
                        }//ContextMenu
                //-----ContextMenu----End---
                
                if self.profileIcon.count != 0 {
                Button(action: {
                    self.iconPicker.toggle()
                }) {
                    Image(uiImage: UIImage(data: self.profileIcon)!)
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                        .shadow(color: self.chooce.chooce ? Color.init(#colorLiteral(red: 0.9529411765, green: 0.9764705882, blue: 1, alpha: 1)) : Color.init(#colorLiteral(red: 0.1411764706, green: 0.1450980392, blue: 0.1607843137, alpha: 1)),radius: 5, x: -5, y: -5)
                        
                        .shadow(color: self.chooce.chooce ? Color.init(#colorLiteral(red: 0.7450980392, green: 0.7960784314, blue: 0.8470588235, alpha: 1)) : Color.init(#colorLiteral(red: 0.08235294118, green: 0.08235294118, blue: 0.09411764706, alpha: 1)),radius: 5, x: 5, y: 5)
                }
                } else {
                    Button(action: {
                        self.iconPicker.toggle()
                    }) {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.gray)
                    }
                }
                
                })
                
                .onAppear {
                   // self.translater = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        self.translater = false
                    }
                }
                
                if self.translater {
                    Text("Biografy in \(self.detectLanguage.detectLanguage(idioma: language)!)")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.black.opacity(0.50))
                        .cornerRadius(10)
                }
                
                
            }.sheet(isPresented: self.$showPicker) {
                
                NewView().environment(\.managedObjectContext, self.moc)
                
            }
            
            .preferredColorScheme(self.chooce.chooce ? .light : .dark)
            
        }//NavigationView
    }
    //-----Translates----Start--
    
    func translates() {}//This implementation coming soon
    
    //-----Translates----End--
    
    
    //-------------------Delete-------------------Start------
    func delete(at offsets : IndexSet) {
        for index in offsets {
            let delet = saly[index]
            self.moc.delete(delet)
        }
        try! self.moc.save()
    }
    //-------------------Delete-------------------End------
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//-------------------Indicator-------------------Start------
struct Indicator: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        
        let indicator = UIActivityIndicatorView()
        indicator.startAnimating()
        indicator.hidesWhenStopped = true
        indicator.color = UIColor.systemTeal
        indicator.style = .large
        
        return indicator
    }
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        //
    }
}
//-------------------Indicator-------------------End------


//-------------------SchemeMode-------------------Start------
//This enable the SchemeMode to the whole app
class SchemeMode : ObservableObject {
    
    @Published public var chooce : Bool = UserDefaults.standard.bool(forKey: "chooce") {
        didSet {
            
            UserDefaults.standard.set(self.chooce, forKey: "chooce")
        }
    }
}
//-------------------SchemeMode-------------------End------


//-----------Mute---------None--------
class ImgMode : ObservableObject {
    
    @Published public var image : URL = UserDefaults.standard.url(forKey: "image")! {
        didSet {
            
            UserDefaults.standard.set(self.image, forKey: "image")
        }
    }
}


class DetectLanguage: ObservableObject {
    @Published var language : String = ""
    @Published var result : String = ""
    
    func detectLanguage(idioma: String) -> String? {
        let locale = Locale(identifier: "en")
        let recognizer = NLLanguageRecognizer()
        
        recognizer.processString(idioma)
        
        guard let languages = recognizer.dominantLanguage else { return "Unable to recognize language" }
        return locale.localizedString(forLanguageCode: languages.rawValue)!
        //return locale.localizedString(forRegionCode: languages.rawValue)
    }
}

// You can find the gitHub Link on the description with the whole source code!!!

//I hope you like it!!!
