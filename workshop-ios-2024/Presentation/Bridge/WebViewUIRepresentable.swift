//
//  WebViewUIRepresentable.swift
//  workshop-ios-2024
//
//  Created by ODC on 26/3/2024.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {

    let url : URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
 
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url:url)
        webView.load(request)
    }
    
}


