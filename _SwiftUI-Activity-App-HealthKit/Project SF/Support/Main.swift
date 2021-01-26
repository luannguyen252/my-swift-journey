import Foundation

@main
struct Main {
    static func main() {
        if !ProcessInfo.processInfo.isTesting {
            ProjectSFApp.main()
        } else {
            TestApp.main()
        }
    }
}
