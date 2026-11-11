import SwiftUI
import UIKit
import WebKit

// Yerel HTML dosyalarini kullanan gercek iPadOS uygulama kabugu.
// Oyun internet baglantisi olmadan calisir.
@main
struct MayinTarlasiApp: App {
    var body: some Scene {
        WindowGroup {
            GameWebView()
                .ignoresSafeArea()
        }
    }
}

struct GameWebView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        let configuration = WKWebViewConfiguration()
        configuration.defaultWebpagePreferences.allowsContentJavaScript = true

        let webView = WKWebView(frame: .zero, configuration: configuration)
        let background = UIColor(red: 14.0 / 255.0,
                                 green: 23.0 / 255.0,
                                 blue: 38.0 / 255.0,
                                 alpha: 1.0)
        webView.isOpaque = false
        webView.backgroundColor = background
        webView.scrollView.backgroundColor = background
        webView.scrollView.bounces = false
        webView.scrollView.contentInsetAdjustmentBehavior = .never

        guard let pageURL = Bundle.main.url(forResource: "index",
                                            withExtension: "html",
                                            subdirectory: "Web") else {
            webView.loadHTMLString("<h2>Oyun dosyasi bulunamadi.</h2>", baseURL: nil)
            return webView
        }

        webView.loadFileURL(pageURL,
                            allowingReadAccessTo: pageURL.deletingLastPathComponent())
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        // Oyun arayuzu JavaScript tarafindan guncellenir.
    }
}
