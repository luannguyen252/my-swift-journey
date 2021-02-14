import Foundation

struct ViewModel {
    func fetchData(completion: @escaping (Article) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            let article = Article(title: "Swift UI",
                                  body: "SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift.",
                                  imageName: "swift")
            completion(article)
        }
    }
}
