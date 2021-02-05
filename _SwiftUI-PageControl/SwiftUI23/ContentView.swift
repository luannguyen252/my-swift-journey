import SwiftUI

struct ContentView: View {
    @State var currentPage = 0
    
    var body: some View {
        ZStack {
            if #available(iOS 14.0, *) {
                Color("white").ignoresSafeArea(.all, edges: .all)
            } else {
                // Fallback on earlier versions
            }
            
            VStack {
                ZStack {
                    if currentPage == 0 {
                         Image("page1")
                            .resizable()
                            .frame(height: 400)
                            .cornerRadius(16)
                            .padding()
                    } else if currentPage == 1 {
                         Image("page2")
                            .resizable()
                            .frame(height: 400)
                            .cornerRadius(16)
                            .padding()
                    } else {
                       Image("page3")
                        .resizable()
                        .frame(height: 400)
                        .cornerRadius(16)
                        .padding()
                    }
                }
                
                PageControlView(current: currentPage)
                
                HStack {
                    Button(action: {
                        if self.currentPage != 0 {
                            self.currentPage = self.currentPage - 1
                        }
                    }) {
                        Text("Previous")
                            .fontWeight(.heavy)
                            .padding()
                    }
                    .background(Color("orange"))
                    .foregroundColor(Color("dark"))
                    .cornerRadius(8)
                    
                    Button(action: {
                        if self.currentPage < 3 {
                            self.currentPage = self.currentPage + 1
                        }
                    }) {
                        Text("Next")
                            .fontWeight(.heavy)
                            .padding()
                    }
                    .background(Color("yellow"))
                    .foregroundColor(Color("dark"))
                    .cornerRadius(8)
                }
            }
            .animation(.spring())
        }
        .statusBar(hidden: true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct PageControlView: UIViewRepresentable {
    var current = 0
    
    func makeUIView(context: UIViewRepresentableContext<PageControlView>) -> UIPageControl {
        let page = UIPageControl()
        page.currentPageIndicatorTintColor = .black
        page.numberOfPages = 3
        page.pageIndicatorTintColor = .gray
        return page
    }
    
    func updateUIView(_ uiView: UIPageControl, context: UIViewRepresentableContext<PageControlView>) {
        uiView.currentPage = current
    }
}
