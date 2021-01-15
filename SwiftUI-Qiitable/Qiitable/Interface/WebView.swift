import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    private let htmlBody: String

    init(htmlBody: String) {
        self.htmlBody = htmlBody
    }

    func makeUIView(context: UIViewRepresentableContext<WebView>) -> WKWebView {
        let configure = WKWebViewConfiguration()
        let preferences = WKPreferences()
        configure.preferences = preferences
        let view = WKWebView(frame: .zero, configuration: configure)
        view.allowsBackForwardNavigationGestures = true
        view.navigationDelegate = context.coordinator
        return view
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(htmlBody, baseURL: nil)
    }

    func makeCoordinator() -> WebView.Coordinator {
        Coordinator()
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        // リクエスト前
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            decisionHandler(.allow)
        }
        // レスポンス取得後
        func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
            decisionHandler(.allow)
        }

        // 読み込み開始
        func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            webView.evaluateJavaScript(getJS())
        }

        private func getJS() -> String {
            return """
            var newStyle = document.createElement('style');
            newStyle.type = 'text/css';
            document.getElementsByTagName('head').item(0).appendChild(newStyle);
            css = document.styleSheets.item(0);
            css.insertRule('body { background-color:#FFFAFA; }', 0);
            css.insertRule('body { width: 100%; }', 0);

            css.insertRule('.code-frame { background-color:#000000; }', 0);
            css.insertRule('.code-frame { color:#00FF00; }', 0);
            css.insertRule('.code-frame { font-size: 40px; }', 0);
            css.insertRule('.code-frame { width: 100%; }', 0);
            css.insertRule('.code-frame { overflow-wrap : break-word; }', 0);

            css.insertRule('p { font-size: 40px; }', 0);
            css.insertRule('h1 { font-size: 52px; }', 0);
            css.insertRule('h2 { font-size: 48px; }', 0);
            css.insertRule('h3 { font-size: 44px; }', 0);
            css.insertRule('ul { font-size: 40px; }', 0);
            """
        }
    }
}
