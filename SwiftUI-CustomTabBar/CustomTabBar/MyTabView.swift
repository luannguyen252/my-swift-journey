import SwiftUI

struct MyTabView: View {
    @Binding var currentPage: Int
    var width = UIScreen.main.bounds.width
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                Rectangle()
                    .foregroundColor(Color.gray)
                    .frame(width: width, height: 88)
                
                HStack(spacing: 88) {
                    Button(action: {
                        self.currentPage = 1
                    }) {
                        VStack {
                            Image(systemName: "flame")
                                .foregroundColor(Color.red)
                                .font(.system(size: 32, weight: .bold, design: .rounded))
                            
                        }
                    }.padding(.bottom, 24)
                    
                    Button(action: {
                        self.currentPage = 2
                    }) {
                        VStack {
                            Image(systemName: "bolt")
                                .foregroundColor(Color.yellow)
                                .font(.system(size: 32, weight: .bold, design: .rounded))
                            
                        }
                    }.padding(.bottom, 24)
                    
                    Button(action: {
                        self.currentPage = 3
                    }) {
                        VStack {
                            Image(systemName: "leaf.arrow.circlepath")
                                .foregroundColor(Color.green)
                                .font(.system(size: 32, weight: .bold, design: .rounded))
                            
                        }
                    }.padding(.bottom, 24)
                    
                }
            }
        }.edgesIgnoringSafeArea(.bottom)
    }
}

struct Page1: View {
    var body: some View {
        NavigationView {
            VStack {
                List(0..<30) { i in
                    Text("\(i)列目")
                }
            }.navigationBarTitle("1ページ目")
        }
    }
}

struct Page2: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(1..<8) { i in
                    Image("irasutoya\(i)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }.navigationBarTitle("2ページ目")
        }
    }
}

struct Page3: View {
    var body: some View {
        NavigationView {
            VStack {
                List(0..<30) { i in
                    Text("\(i)列目")
                }
            }.navigationBarTitle("3ページ目")
        }
    }
}
