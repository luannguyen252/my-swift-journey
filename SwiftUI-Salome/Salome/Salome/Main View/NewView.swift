//
//  NewView.swift
//  Salome
//
//  Created by App Designer2 on 15.08.20.
//

import SwiftUI

struct NewView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var dismiss
    @State var name = ""
    @State var bio = ""
    @State var url = ""
    @State var photo : Data = .init(count: 0)
    @State var profile : Data = .init(count: 0)
    @State var showPicker = false
    @State var showProfile = false
    
    @State var date = Date()
    
    @State var sourceType : UIImagePickerController.SourceType = .photoLibrary
    
    @State var showCollection = false
    
    @ObservedObject public var chooce = SchemeMode()
    
    
    @State var actionSheets : Bool = false
    var body: some View {
        NavigationView {
        ZStack {
            Rectangle()
                .fill(self.chooce.chooce ? Color.init(#colorLiteral(red: 0.8705882353, green: 0.9176470588, blue: 0.9647058824, alpha: 1)) : Color.init(#colorLiteral(red: 0.1019607843, green: 0.1058823529, blue: 0.1176470588, alpha: 1)))
                .edgesIgnoringSafeArea(.all)
            
            ScrollView(.vertical, showsIndicators: false) {
                
                    Section(header: Text("")) {
                    if self.photo.count != 0 {
                        Button(action: {
                            self.actionSheets.toggle()
                            }) {
                            Image(uiImage: UIImage(data: photo)!)
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .cornerRadius(6)
                        }
                    } else {
                        Button(action: {
                            self.actionSheets.toggle()
                        }) {
                        Image(systemName: "photo.fill")
                            .resizable()
                            .foregroundColor(.gray)
                            .frame(width: 50, height: 50)
                            .cornerRadius(6)
                        }
                    }
                    }//.padding(.leading, 140)
                
                VStack(alignment: .leading, spacing: 15) {
                    Section(header: Text("Required").foregroundColor(.gray)) {
                        TextField("Name...", text: self.$name)
                            .padding()
                            .background(self.chooce.chooce ? Color.init(#colorLiteral(red: 0.8705882353, green: 0.9176470588, blue: 0.9647058824, alpha: 1)) : Color.init(#colorLiteral(red: 0.1019607843, green: 0.1058823529, blue: 0.1176470588, alpha: 1)))
                            
                            .allowsHitTesting(true)
                            .cornerRadius(16)
                            
                            //lightShadow
                            .shadow(color: self.chooce.chooce ? Color.init(#colorLiteral(red: 0.9529411765, green: 0.9764705882, blue: 1, alpha: 1)) : Color.init(#colorLiteral(red: 0.1411764706, green: 0.1450980392, blue: 0.1607843137, alpha: 1)),radius: 5, x: -5, y: -5)
                            
                            //darkShadow
                            .shadow(color: self.chooce.chooce ? Color.init(#colorLiteral(red: 0.7450980392, green: 0.7960784314, blue: 0.8470588235, alpha: 1)) : Color.init(#colorLiteral(red: 0.08235294118, green: 0.08235294118, blue: 0.09411764706, alpha: 1)),radius: 5, x: 5, y: 5)
                    
                    
                        TextField("Biografy...",text: self.$bio)
                            .padding()
                            .background(self.chooce.chooce ? Color.init(#colorLiteral(red: 0.8705882353, green: 0.9176470588, blue: 0.9647058824, alpha: 1)) : Color.init(#colorLiteral(red: 0.1019607843, green: 0.1058823529, blue: 0.1176470588, alpha: 1)))
                            .allowsHitTesting(true)
                            .cornerRadius(16)
                            
                            //lightShadow
                            .shadow(color: self.chooce.chooce ? Color.init(#colorLiteral(red: 0.9529411765, green: 0.9764705882, blue: 1, alpha: 1)) : Color.init(#colorLiteral(red: 0.1411764706, green: 0.1450980392, blue: 0.1607843137, alpha: 1)),radius: 5, x: -5, y: -5)
                            
                            //darkShadow
                            .shadow(color: self.chooce.chooce ? Color.init(#colorLiteral(red: 0.7450980392, green: 0.7960784314, blue: 0.8470588235, alpha: 1)) : Color.init(#colorLiteral(red: 0.08235294118, green: 0.08235294118, blue: 0.09411764706, alpha: 1)),radius: 5, x: 5, y: 5)
                        
                        
                        TextField("https://url.com/required",text: self.$url)
                            .padding()
                            .keyboardType(.URL)
                            .background(self.chooce.chooce ? Color.init(#colorLiteral(red: 0.8705882353, green: 0.9176470588, blue: 0.9647058824, alpha: 1)) : Color.init(#colorLiteral(red: 0.1019607843, green: 0.1058823529, blue: 0.1176470588, alpha: 1)))
                            .allowsHitTesting(true)
                            .cornerRadius(16)
                            
                            //lightShadow
                            .shadow(color: self.chooce.chooce ? Color.init(#colorLiteral(red: 0.9529411765, green: 0.9764705882, blue: 1, alpha: 1)) : Color.init(#colorLiteral(red: 0.1411764706, green: 0.1450980392, blue: 0.1607843137, alpha: 1)),radius: 5, x: -5, y: -5)
                            
                            //darkShadow
                            .shadow(color: self.chooce.chooce ? Color.init(#colorLiteral(red: 0.7450980392, green: 0.7960784314, blue: 0.8470588235, alpha: 1)) : Color.init(#colorLiteral(red: 0.08235294118, green: 0.08235294118, blue: 0.09411764706, alpha: 1)),radius: 5, x: 5, y: 5)
                        
                    }
                    
                    .actionSheet(isPresented: self.$actionSheets) {
                            ActionSheet(title: Text("Select One"), message: Text("Please select photo from the library or use the camera or from the saved photos on album!"), buttons: [.default(Text("Camera")) {
                                self.showPicker.toggle()
                                self.sourceType = .camera
                                
                            }, .default(Text("PhotoLibrary")) {
                                self.sourceType = .photoLibrary
                                self.showPicker.toggle()
                            },
                            .default(Text("SavedPhotosAlbum")) {
                                self.showPicker.toggle()
                                self.sourceType = .savedPhotosAlbum
                            }, .cancel()])
                        }
                    
                    
                }.padding()
                
                .sheet(isPresented: self.$showProfile) {
                    ImagePicker(show: self.$showProfile, image: self.$profile, sourceType: self.sourceType)
                }
                
                //Btn
                Section(header: Text("")) {
                Button(action: {
                    let new = Nael(context: self.moc)
                    new.photo = self.photo
                    new.profile = self.profile
                    new.name = self.name
                    new.biografie = self.bio
                    new.url = self.url
                    new.date = self.date
                    
                    try! self.moc.save()
                    
                    self.profile.count = 0
                    self.photo.count = 0
                    self.name = ""
                    self.bio = ""
                    self.url = ""
                    
                    self.dismiss.wrappedValue.dismiss()
                }) {
                    Text("New")
                        .bold()
                        .padding(8)
                        .foregroundColor(self.photo.count > 0 && self.name.count > 4 && self.bio.count > 10 && self.profile.count > 0 ? .white : .black)
                }.frame(width: 150, height: 40)
                .background(self.photo.count > 0 && self.name.count > 4 && self.bio.count > 10 && self.profile.count > 0 ? Color.blue : Color.gray.opacity(0.60))
                
                .cornerRadius(10)
                //lightShadow
                .shadow(color: self.chooce.chooce ? Color.init(#colorLiteral(red: 0.9529411765, green: 0.9764705882, blue: 1, alpha: 1)) : Color.init(#colorLiteral(red: 0.1411764706, green: 0.1450980392, blue: 0.1607843137, alpha: 1)),radius: 5, x: -5, y: -5)
                
                //darkShadow
                .shadow(color: self.chooce.chooce ? Color.init(#colorLiteral(red: 0.7450980392, green: 0.7960784314, blue: 0.8470588235, alpha: 1)) : Color.init(#colorLiteral(red: 0.08235294118, green: 0.08235294118, blue: 0.09411764706, alpha: 1)),radius: 5, x: 5, y: 5)
                
                .disabled(self.photo.count > 0 && self.name.count > 4 && self.bio.count > 10 && self.profile.count > 0 ? false : true)
                }//.padding(.leading, 90)
                //Btn
                
                
            }.navigationBarTitle("New", displayMode: .inline)
            .navigationBarItems(leading: HStack { if self.profile.count != 0 {
            Button(action: {
                self.showProfile.toggle()
            }) {
                Image(uiImage: UIImage(data: self.profile)!)
                .renderingMode(.original)
                .resizable()
                .clipShape(Circle())
                .frame(width: 30, height: 30)
                    
                    //lightShadow
                    .shadow(color: self.chooce.chooce ? Color.init(#colorLiteral(red: 0.9529411765, green: 0.9764705882, blue: 1, alpha: 1)) : Color.init(#colorLiteral(red: 0.1411764706, green: 0.1450980392, blue: 0.1607843137, alpha: 1)),radius: 5, x: -5, y: -5)
                    
                    //darkShadow
                    .shadow(color: self.chooce.chooce ? Color.init(#colorLiteral(red: 0.7450980392, green: 0.7960784314, blue: 0.8470588235, alpha: 1)) : Color.init(#colorLiteral(red: 0.08235294118, green: 0.08235294118, blue: 0.09411764706, alpha: 1)),radius: 5, x: 5, y: 5)
            }
        } else {
            Button(action: {
                self.showProfile.toggle()
            }) {
            Image(systemName: "person.crop.circle.badge.plus")
                .resizable()
                .frame(width: 32, height: 30)
                .foregroundColor(.gray)
                
                //lightShadow
                .shadow(color: self.chooce.chooce ? Color.init(#colorLiteral(red: 0.9529411765, green: 0.9764705882, blue: 1, alpha: 1)) : Color.init(#colorLiteral(red: 0.1411764706, green: 0.1450980392, blue: 0.1607843137, alpha: 1)),radius: 5, x: -5, y: -5)
                
                //darkShadow
                .shadow(color: self.chooce.chooce ? Color.init(#colorLiteral(red: 0.7450980392, green: 0.7960784314, blue: 0.8470588235, alpha: 1)) : Color.init(#colorLiteral(red: 0.08235294118, green: 0.08235294118, blue: 0.09411764706, alpha: 1)),radius: 5, x: 5, y: 5)
            }
        } } //Else
            , trailing: Button(action: {self.dismiss.wrappedValue.dismiss()}) {
                Text("Cancel")
                    .font(.system(size: 20))
                })
            
        }
        
        }.background(self.chooce.chooce ? Color.init(#colorLiteral(red: 0.8705882353, green: 0.9176470588, blue: 0.9647058824, alpha: 1)) : Color.init(#colorLiteral(red: 0.1019607843, green: 0.1058823529, blue: 0.1176470588, alpha: 1)))
        
        .preferredColorScheme(self.chooce.chooce ? .light : .dark)
        
        .sheet(isPresented: self.$showPicker) {
    ImagePicker(show: self.$showPicker, image: self.$photo, sourceType: self.sourceType)
}
    }
}

struct NewView_Previews: PreviewProvider {
    static var previews: some View {
        NewView()
    }
}
