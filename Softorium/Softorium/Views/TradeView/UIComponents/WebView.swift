//
//  WebView.swift
//  Softorium
//
//  Created by AlexKotov on 11.12.23.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let urlString: String
    let targetClass: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
        uiView.layer.cornerRadius = 12
        uiView.layer.masksToBounds = true
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView

        init(_ parent: WebView) {
            self.parent = parent
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            let script = """
                        var allElements = document.querySelectorAll('*');
                        var elementsToStay = document.getElementsByClassName(\(parent.targetClass)');
                        var newArray = allElements.filter(function(element) {
                            return !elementsToStay.includes(element);
                        });
                        newArray.forEach(function(element) {
                            element.style.display = 'none';
                        });
                        """
            
            webView.evaluateJavaScript(script, completionHandler: nil)
        }
    }
}
