import Foundation

struct ViewModel {
    func fetchData(completion: @escaping (Article) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            let article = Article(title: "Swift UI 101",
                                  body: "Learn SwiftUI by examples, with clear understandable explanations and more! Subscribe now!",
                                  imageName: "graduationcap")
            completion(article)
        }
    }
}
