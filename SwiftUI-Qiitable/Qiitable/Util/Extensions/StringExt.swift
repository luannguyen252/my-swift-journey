import Foundation

extension String {
    func getProfileURL() -> URL {
        guard let url = URL(string: self) else {
            return URL(string: "https://help.qiita.com/images/qiitan-button.png")!
        }
        return url
    }
}
