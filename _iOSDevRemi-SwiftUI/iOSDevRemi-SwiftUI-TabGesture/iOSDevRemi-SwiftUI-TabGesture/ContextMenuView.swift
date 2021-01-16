import SwiftUI

struct ContextMenuView: View {
    @State var showingPunchline = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                HStack {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                        
                        LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.green]), startPoint: .bottom, endPoint: .leading)
                            .cornerRadius(18)
                            .shadow(color: Color.secondary.opacity(1), radius: 2, x: 1, y: 1)
                            .shadow(color: Color.secondary.opacity(1), radius: 2, x: -1, y: -1)
                        
                        VStack {
                            Image(systemName: "1.square")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 80, height: 80)
                            Text("hello")
                                .font(.title)
                                .foregroundColor(.white)
                        }
                        .padding()
                    }
                    .contextMenu {
                        VStack {
                            Button(action: {
                                print("share")
                            }) {
                                HStack {
                                    Text("share")
                                    Image(systemName: "square.and.arrow.up")
                                }
                            }
                            Button(action: {
                                print("mark as unread")
                            }) {
                                HStack {
                                    Text("mark as unread")
                                    Image(systemName: "book.circle")
                                }
                            }
                            Button(action: {
                                print("bookmark")
                            }) {
                                HStack {
                                    Text("bookmark")
                                    Image(systemName: "bookmark")
                                }
                            }
                        }
                    }
                    
                    Spacer(minLength: 20)
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                        
                        LinearGradient(gradient: Gradient(colors: [Color.green, Color.yellow]), startPoint: .top, endPoint: .leading)
                            .cornerRadius(18)
                            .shadow(color: Color.secondary.opacity(1), radius: 2, x: 1, y: 1)
                            .shadow(color: Color.secondary.opacity(1), radius: 2, x: -1, y: -1)
                        
                        VStack {
                            Image(systemName: "2.square")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 80, height: 80)
                            Text("hello")
                                .blur(radius: self.showingPunchline ? 0 : 20)
                                .font(.title)
                                .foregroundColor(.white)
                        }
                        .padding()
                    }
                    .onTapGesture {
                        withAnimation {
                            self.showingPunchline.toggle()
                        }
                    }
                }
                .padding()
                .frame(height: 160)
            }
            .navigationBarTitle("Calendar")
        }
    }
}

struct ContextMenuView_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenuView()
            .environment(\.colorScheme, .dark)
    }
}
