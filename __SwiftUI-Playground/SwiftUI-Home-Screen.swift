import SwiftUI
import PlaygroundSupport

struct Screen: View {
    var body: some View {
        VStack {
            ForEach(1...4, id: \.self) { _ in
                HStack {
                    Spacer()
                    VStack {
                        Rectangle().frame(width: 60, height: 60).foregroundColor(Color(UIColor.systemRed)).cornerRadius(16)
                        Text("App").font(.footnote).padding(.top, 2)
                    }
                    Spacer()
                    VStack {
                        Rectangle().frame(width: 60, height: 60).foregroundColor(Color(UIColor.systemOrange)).cornerRadius(16)
                        Text("App").font(.footnote).padding(.top, 2)
                    }
                    Spacer()
                    VStack {
                        Rectangle().frame(width: 60, height: 60).foregroundColor(Color(UIColor.systemYellow)).cornerRadius(16)
                        Text("App").font(.footnote).padding(.top, 2)
                    }
                    Spacer()
                    VStack {
                        Rectangle().frame(width: 60, height: 60).foregroundColor(Color(UIColor.systemGreen)).cornerRadius(16)
                        Text("App").font(.footnote).padding(.top, 2)
                    }
                    Spacer()
                }
            }.padding(.top)
            
            Spacer()
            
            HStack {
                Rectangle().frame(width: 60, height: 60).foregroundColor(Color(UIColor.systemBlue)).cornerRadius(16)
                
                Spacer()
                
                Rectangle().frame(width: 60, height: 60).foregroundColor(Color(UIColor.systemIndigo)).cornerRadius(16)
                
                Spacer()
                
                Rectangle().frame(width: 60, height: 60).foregroundColor(Color(UIColor.systemPurple)).cornerRadius(16)
                
                Spacer()
                
                Rectangle().frame(width: 60, height: 60).foregroundColor(Color(UIColor.systemPink)).cornerRadius(16)
            }.padding().background(Color(UIColor.secondarySystemBackground)).cornerRadius(20).padding()
        }
    }
}

PlaygroundPage.current.setLiveView(Screen())