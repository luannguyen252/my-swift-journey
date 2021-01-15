//
//  DetailView.swift
//  Salome
//
//  Created by App Designer2 on 15.08.20.
//

import SwiftUI
import PhotosUI
import Combine

struct DetailView: View {
    //var detail : Info
    @Environment(\.managedObjectContext) var moc
    
    @Environment(\.presentationMode) var dismiss
    
    //By only use @ObservedObject = entityName() we are allow to use all its data to display on the DetailView
    @ObservedObject var detail = Nael()
    
    
    @State var photo : Data = .init(count: 0)
    @State var profile : Data = .init(count: 0)
    
    @State var order = false
    @State var comment = false
    
    //Start date
    static var dateFormatter : DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        return formatter
    }()
    
    var date = Date()
    //End date
    
    
    //Start hour
    static var formatHour : DateFormatter = {
        let formatter = DateFormatter()
        //formatter.dateStyle = .medium
        formatter.dateFormat = "hh:mm a"
        
        return formatter
    }()
    
    var hour = Date()
    //End hour
    
    @State var colors = UIColor.white
    
    @State var colorPicker = false
    
    @State var comments = ""
    
    //start Collection
    @State var images : [UIImage] = []
    @State var showPicker = false
    @State var any = PHPickerConfiguration()
    
    var columns = Array(repeating: GridItem(.fixed(130), spacing: 8), count: 1)
    //End collection
    
    //@ObservedObject var register = LoginSignUp()
    
    @ObservedObject var details = NameSpace()
    
    @ObservedObject var global = GlobalData()
    
    @ObservedObject public var chooce = SchemeMode()
    
    @Namespace var bigPic
    @State var select : Bool = false
    @State var object : [Any] = []
    
    
    //---------Detect--Language------------------Start---
    @ObservedObject var detectLanguage = DetectLanguage()
    @State var language = ""
    @State var translater = false
    //---------Detect--Language-------------------End----
    
    
    
    var body: some View {
        
        
        VStack(spacing: 10) {
            
            ZStack {
                
                Image(uiImage: UIImage(data: detail.photo ?? self.photo)!)
                .resizable()
                .frame(height: 270)
                    //.onReceive(timer) { _ in
                        
                Image(uiImage: UIImage(data: detail.profile ?? self.profile)!)
                    .renderingMode(.original)
                .resizable()
                    .clipShape(Circle())
                    .frame(width: 120,height: 120)
                    //.matchedGeometryEffect(id: "nael", in: details.detail)
                    .overlay(Circle().stroke(Color.gray.opacity(0.60), lineWidth: 2))
                    .shadow(radius: 5)
                    .offset(x: -0, y: 120)
                    
                Button(action: {
                    self.showPicker.toggle()
                }) {
                    Image(systemName: "camera.fill")
                        .font(.system(size: 20))
                        //.foregroundColor(.gray)
                        
                }.offset(x: 60, y: 135)
                
            }//ZStack child
            
            Spacer(minLength: 30)
            ZStack {
                Rectangle()
                    .fill(Color.init("background"))
                    .edgesIgnoringSafeArea(.all)
            Form {
                //.padding()
               
                Section(header: Text("Name:")){
                    Text("\( detail.name!)")
                .font(.headline)
                }
                
                Section(header: Text("Biografie or Detail:")){
                    Text("\(detail.biografie!.localizedCapitalized)").padding(4)
                    .font(.callout)
                        .foregroundColor(Color.gray)
                    
                    //.background(Color.init(self.colors))
                    .cornerRadius(8)
                }
                //Collection
                Section(header: Text("Collections: \(Image(systemName: "photo.on.rectangle.angled"))")) {
                    HStack {
                    
                        Button(action: {
                            self.showPicker.toggle()
                        }) {
                            Image(systemName: "rectangle.stack.badge.plus")
                                .font(.system(size: 20))
                                .foregroundColor(Color.gray)
                        }
                        Spacer()
                        
                        Text("\(self.global.image.count) \(Image(systemName: "photo.on.rectangle.angled"))")
                            .foregroundColor(.gray)
                    }
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    if self.global.image.isEmpty {
                        HStack {
                            //Text("No")
                            Image(systemName: "photo.fill")
                            
                        }.foregroundColor(.gray)
                    //We are already done
                    } else {
                        
                        LazyHGrid(rows: columns, spacing: 8) {
                            ForEach(self.global.image, id: \.self) { pho in
                                withAnimation(Animation.default) {
                                ZStack {
                                    
                                Image(uiImage: pho)
                                    .renderingMode(.original)
                                    .resizable()
                                    .frame(width: 140, height: 140)
                                    //.matchedGeometryEffect(id: "bigPic", in: bigPic)
                                    .cornerRadius(10)
                                    .shadow(radius: 4)
                    
                                    /*.onTapGesture {
                                        self.select.toggle()
                                        object.append(UIImage(cgImage: self.images as! CGImage))
                                    }*/
                                    
                                    Button(action: {
                                        delete()
                                        
                                    }) {
                                        Image(systemName: "trash.circle.fill")
                                            .font(.system(size: 25))
                                            .background(Color.red)
                                            .foregroundColor(.white)
                                            .clipShape(Circle())
                                            
                                            //.clipped()
                                    }.position(x: 120, y: 120)
                                }
                                } .animation(Animation.default) //withAnimation
                            }
                        }
                    }
                
            }//ScrollView
                .sheet(isPresented: self.$select) {
                    SharingItem(objects: object)
                }
                }//VStack
                //Collection
                
                Section(header: Text("Posted:")){
                    HStack {
                    Text("\(detail.date ?? self.date, formatter: Self.dateFormatter),")
                        .font(.caption)
                        .foregroundColor(.secondary)
                .font(.headline)
                    
                    Text("\(detail.date ?? self.hour, formatter: Self.formatHour)")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                .font(.headline)
                    }
                }
                Section(header: Text("Your website:")) {
                    if detail.url?.isEmpty == false {
                Link("Visit our website", destination: URL(string: "\(detail.url ?? "")")!)
                    
                    } else {
                        Image(systemName: "link.circle")
                            .foregroundColor(.gray)
                    }
                }
            }.listStyle(GroupedListStyle())
            .environment(\.horizontalSizeClass, .regular)
            
            Spacer()
            
                .onAppear {
                    self.translater = true
                    
                    if let prediction = self.detectLanguage.detectLanguage(idioma: detail.biografie!) {
                        print(prediction)
                        self.language = prediction
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        self.translater = false
                    }
                }
                
                if self.translater {
                    Text("Biografie in \(self.detectLanguage.detectLanguage(idioma: detail.biografie!)!)")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green.opacity(0.75))
                        .cornerRadius(10)
                }
        }
            /*Button(action: {}) {
                Image(systemName: "bubble.left.fill")
            }*/
        
            
    }.preferredColorScheme(self.chooce.chooce ? .light : .dark)//VStack father
        .edgesIgnoringSafeArea(.top)//ScrollView
        .sheet(isPresented: self.$showPicker) {
            PhotoPicker(photos: self.$global.image, showCollection: self.$showPicker)
        }
        
    }
    
    func delete(){
        self.global.image.removeLast()
        print(self.images.count)
    }
}


struct SharingItem : UIViewControllerRepresentable {
    
    var objects : [Any]
    func makeUIViewController(context: Context) -> UIActivityViewController {
        
        let share = UIActivityViewController(activityItems: objects, applicationActivities: nil)
        return share
    }
    func updateUIViewController(_ uiView: UIActivityViewController, context: Context) {
        //
    }
    
}
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}

class NameSpace : ObservableObject {
     @Namespace var detail
}

