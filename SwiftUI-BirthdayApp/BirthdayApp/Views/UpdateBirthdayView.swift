//
//  UpdateBirthdayView.swift
//  BirthdayApp
//
//  Created by jb on 2020/10/13.
//

import SwiftUI

class UpdateBirthdayData: ObservableObject {
    @Published var name: String = ""
    @Published var date: Date = Date()
    @Published var id: UUID = UUID()
}

struct UpdateBirthdayView: View {
    @Environment(\.presentationMode) var presentation
    @ObservedObject var data = UpdateBirthdayData()
    private let viewModel = UpdateBirthdayViewModel()
    
    init(bdayVM: BirthdayViewModel){
        data.id = bdayVM.id
        data.name = bdayVM.name
        data.date = bdayVM.date
    }
    
    var body: some View {
        VStack{
            HStack{
                Text("Update Birthday")
                    .font(.title)
                Spacer()
            }
            .padding(.bottom, 10)
            
            TextField("Enter name", text: $data.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 10)
                .foregroundColor(.black)
            
            VStack {
                VStack{
                    Text("Date of Birth")
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: 40)
                        .background(Rectangle().fill(Color.red))
                    
                    DatePicker(selection: $data.date, in: ...Date(), displayedComponents: .date){
                        Text("")
                    }.labelsHidden()
                    .padding()
                }.clipShape(RoundedRectangle(cornerRadius: 20))
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                .padding()
                .shadow(radius: 5)
                
                HStack(spacing: 30){
                    Button(action: {self.presentation.wrappedValue.dismiss()}){
                        Text("Cancel")
                            .bold()
                    }.padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray))
                    
                    Button(action: {self.updateBirthDay()}){
                        Text("Save")
                            .bold()
                    }.padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.purple))
                }
                
                Spacer()
            }
        }.foregroundColor(.white)
        .padding()
        .padding(.top, 50)
        .background(LinearGradient(gradient: Gradient(colors: [Color.pink, Color.white]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
        .onTapGesture{
            DismissKeyboardHelper.dismiss()
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    private func updateBirthDay(){
        let birthday = BirthdayViewModel(id: data.id, name: data.name, date: data.date)
        viewModel.updateBirthday(birthday: birthday)
        self.presentation.wrappedValue.dismiss()
        
    }
}

