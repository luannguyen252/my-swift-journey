import Foundation

extension URLSession.DataTaskPublisher {
    func validate<S: Sequence>(statusCode range: S) -> Self where S.Iterator.Element == Int {
        tryMap { data, response -> Data in
            switch (response as? HTTPURLResponse)?.statusCode {
            case .some(let code) where range.contains(code):
                return data
            case .some(let code) where !range.contains(code):
                throw NSError(domain: "out of status code range", code: code)
            default:
                throw NSError(domain: String(data: data, encoding: .utf8) ?? "Network Error", code: 0)
            }
        }.upstream
    }

    func validateNetwork() -> Self {
        tryCatch { error -> URLSession.DataTaskPublisher in
            switch error.networkUnavailableReason {
            // セルラーネットワークが無効
            case .cellular:
                break
            // 低データモード
            case .constrained:
                break
            // 通信量が大きすぎる
            case .expensive:
                break
            default:
                break
            }
            return self
        }.upstream
    }
}
