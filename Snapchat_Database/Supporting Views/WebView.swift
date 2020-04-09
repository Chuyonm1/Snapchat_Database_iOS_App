//
//  WebView.swift
//  Snapchat_Database
//
//  Created by Will  Jones on 3/24/20.
//  Copyright © 2020 Will Jones. All rights reserved.
//

import Foundation
import SwiftUI
import WebKit

//current implementation is a little glitch and doesn't work
//like planned. Sidelining this for now
struct WebView: UIViewRepresentable
{
    var url: String
    
    func makeUIView(context: Context ) -> WKWebView
    {
        guard let url = URL(string: self.url) else {
            return WKWebView()
        }

        let request = URLRequest(url: url)
        let wkWebview = WKWebView()
        wkWebview.load(request)
        return wkWebview
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context)
    {

    }
}
