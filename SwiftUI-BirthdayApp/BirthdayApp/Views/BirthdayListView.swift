//
//  ContentView.swift
//  BirthdayApp
//
//  Created by jb on 2020/10/13.
//

import SwiftUI

struct BirthDayListView: View {
    @ObservedObject var birthdayVM = BirthdayListViewModel()
    @State private var addNewPresented = false
    
    init(){
        // in order to remove bottom empty item lines
        UITableView.appearance().tableFooterView = UIView()
        // remove divider
        UITableView.appearance().separatorStyle = .none
        // remove background color
        UITableView.appearance().backgroundColor = UIColor.clear
        // remove selected highlight thing going on
        UITableViewCell.appearance().selectionStyle = .none
    }
    
    var body: some View {
        NavigationView{
            VStack{
                ZStack(alignment: .bottomTrailing){
                    BirthdayHeader()
                        .padding(.top, 50)
                    Button(action: {self.addNewPresented.toggle()}){
                        Image(systemName: "plus.circle")
                            .font(.title)
                            .foregroundColor(.white)
                    }.padding([.trailing, .bottom], 20)
                    .sheet(isPresented: $addNewPresented, content: {
                        //add new sheet
                        //Text("Add New")
                        AddNewBirthdayView(addNewPresented: self.$addNewPresented).onDisappear{
                            self.refreshData()
                        }
                    })
                }
                List{
                    ForEach(self.birthdayVM.birthdays.indices, id: \.self){idx in
                        ZStack {
                            BirthdayCellView(birthdayVM: self.birthdayVM.birthdays[idx]).shadow(radius: 10)
                            
                            NavigationLink(destination:
                                            UpdateBirthdayView(
                                                bdayVM: self.birthdayVM.birthdays[idx]
                                            )
                                            .navigationTitle("")
                                            .navigationBarHidden(true))
                            {
                                EmptyView()
                            }.buttonStyle(PlainButtonStyle())
                        }
                    }.onDelete(perform: delete(at:))
                    .listRowBackground(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.blue]), startPoint: .leading, endPoint: .trailing))
                }
            }.onAppear {
                self.refreshData()
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.blue]), startPoint: .leading, endPoint: .trailing))
            .navigationBarHidden(true)
            .navigationBarTitle("", displayMode: .inline)
            .edgesIgnoringSafeArea(.all)
        }
    }
    
    func delete(at offsets: IndexSet){
        for index in offsets{
            self.birthdayVM.removeBirthday(at: index)
        }
        refreshData()
    }
    
    func refreshData(){
        self.birthdayVM.fetchAllBirthdays()
    }
}

struct BirthdayHeader: View {
    var body: some View {
        VStack{
            Text("🎂 Birthdays 🎉")
                .font(.largeTitle)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: 60)
                .background(Rectangle().fill(Color.clear))
        }//.edgesIgnoringSafeArea(.all)
    }
}

struct BirthDayListView_Previews: PreviewProvider {
    static var previews: some View {
        BirthDayListView()
    }
}
