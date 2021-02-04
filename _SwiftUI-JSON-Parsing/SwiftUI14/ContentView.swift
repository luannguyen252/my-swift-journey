import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    @ObservedObject var coursesVM: CoursesViewModel = CoursesViewModel()
    
    var body: some View {
        NavigationView{
            ScrollView{
                ForEach(self.coursesVM.courses){ course in
                    AnimatedImage(url: URL(string:course.bannerUrl)).resizable().frame(width: UIScreen.main.bounds.width, height: 300, alignment: .center).animation(.spring())
                    
                    Text(course.name).frame(width: UIScreen.main.bounds.width, alignment: .center)
                    
                    
                }
            }.navigationBarTitle(Text("Courses"))
                .navigationBarItems(trailing: Button(action: {
                    self.coursesVM.fetchCourses()
                }, label: {
                    Text("Fetch")
                }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
