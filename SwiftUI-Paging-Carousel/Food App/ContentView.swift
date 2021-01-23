import SwiftUI

// ContentView
struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Home
struct Home: View {
    @State var page = 0
    @State var menu = 0
    
    var body: some View {
        VStack {
            HStack {
                Text("Food App")
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
                
                Button(action: {
                    print("Go to Cart.")
                }) {
                    Image(systemName: "cart.fill")
                        .foregroundColor(.green)
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 10)
            
            HStack(spacing: 10){
                Button(action: {
                    self.menu = 0
                }){
                    Text("Fast Food")
                        .foregroundColor(self.menu == 0 ? .white : .black)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        .overlay(Capsule().stroke(Color.green, lineWidth: 3))
                }
                .background(self.menu == 0 ? Color.green : Color.white)
                .clipShape(Capsule())
                
                Button(action: {
                    self.menu = 1
                }){
                    Text("Sea Food")
                        .foregroundColor(self.menu == 1 ? .white : .black)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        .overlay(Capsule().stroke(Color.green, lineWidth: 3))
                }
                .background(self.menu == 1 ? Color.green : Color.white)
                .clipShape(Capsule())
                
                Button(action: {
                    self.menu = 2
                }){
                    Text("Dessert")
                        .foregroundColor(self.menu == 2 ? .white : .black)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        .overlay(Capsule().stroke(Color.green, lineWidth: 3))
                }
                .background(self.menu == 2 ? Color.green : Color.white)
                .clipShape(Capsule())
            }
            .padding(.top, 25)
            
            GeometryReader{g in
                Carousel(width: UIScreen.main.bounds.width, page: self.$page, height: g.frame(in: .global).height)
            }
            
            PageControl(page: self.$page)
                .padding(.top, 20)
        }
    }
}

struct CList: View {
    @Binding var page: Int
    
    var body: some View {
        HStack{
            ForEach(data){i in
                Card(page: self.$page, data: i, width: UIScreen.main.bounds.width)
            }
        }
    }
}

struct Card: View {
    @Binding var page: Int
    var data: FoodData
    var width: CGFloat

    var body: some View {
        VStack {
            VStack {
                Spacer()
                
                HStack{
                    Text(self.data.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Spacer()
                }
                
                HStack{
                    Text(self.data.Category)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    
                    Spacer(minLength: 0)
                    
                    Text(self.data.price)
                        .fontWeight(.bold)
                        .padding(.top, 20)
                        .foregroundColor(.white)
                }
            }
            .frame(width: UIScreen.main.bounds.width - 80)
            .padding(.horizontal, 20)
            .padding(.bottom, 25)
            .padding(.vertical, self.page == data.id ? 0 : -25)
            .padding(.horizontal, self.page == data.id ? 0 : -25)
            .background(Image(self.data.image).resizable().scaledToFill())
            .cornerRadius(20)
        }
        .frame(width: self.width)
        .animation(.easeIn)
    }

}

struct Carousel: UIViewRepresentable {
    var width: CGFloat
    @Binding var page: Int
    var height: CGFloat
    
    func makeCoordinator() -> Coordinator {
        return Carousel.Coordinator(carouselC: self)
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        let total = width * CGFloat(data.count)
        let view = UIScrollView()
        view.isPagingEnabled = true
        view.contentSize = CGSize(width: total, height: 1.0)
        view.bounces = true
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.delegate = context.coordinator
        
        let view1 = UIHostingController(rootView: CList(page: self.$page))
        view1.view.frame = CGRect(x: 0, y: 0, width: total, height: self.height)
        view1.view.backgroundColor = .clear
        
        view.addSubview(view1.view)
        
        return view
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {

    }
    
    class Coordinator: NSObject, UIScrollViewDelegate {
        var carousel: Carousel
        
        init(carouselC: Carousel) {
            carousel = carouselC
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            let page = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
            
            self.carousel.page = page
        }
    }
}

struct PageControl: UIViewRepresentable {
    @Binding var page: Int
    
    func makeUIView(context: Context) -> UIPageControl {
        let view = UIPageControl()
        view.currentPageIndicatorTintColor = .green
        view.pageIndicatorTintColor = UIColor.systemTeal.withAlphaComponent(0.2)
        view.numberOfPages = data.count
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        DispatchQueue.main.async {
            uiView.currentPage = self.page
        }
    }
}

struct FoodData: Identifiable {
    var id: Int
    var name: String
    var Category: String
    var price: String
    var image: String
    
}

var data = [
    FoodData(id: 0, name: "Juicy Burger", Category: "Fast Food", price: "$10", image: "1"),
    FoodData(id: 1, name: "Home Made Pizza", Category: "Fast Food", price: "$20", image: "2"),
    FoodData(id: 2, name: "Tower Burger", Category: "Fast Food", price: "$25", image: "3"),
    FoodData(id: 3, name: "Pan Pizza", Category: "Fast Food", price: "$30", image: "4"),
]
