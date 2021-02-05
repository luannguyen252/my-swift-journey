import SwiftUI
import PlaygroundSupport

struct Screen: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("5:45").font(.system(size: 64, weight: .thin))
                Text("Monday, May 11").font(.system(size: 24))
            }.padding(.vertical, 32)
            
            VStack {
                VStack(alignment: .leading) {
                    HStack {
                        Rectangle().frame(width: 16, height: 16).foregroundColor(Color(UIColor.systemFill)).cornerRadius(4)
                        
                        Text("APP NAME").font(.caption)
                        
                        Spacer()
                        
                        Text("21m ago").font(.caption)
                    }
                    
                    Text("Notification title").font(.headline)
                    Text("This is the notification body")
                }.padding().background(Color(UIColor.secondarySystemBackground)).cornerRadius(12)
            }.padding()
        }
    }
}

PlaygroundPage.current.setLiveView(Screen())