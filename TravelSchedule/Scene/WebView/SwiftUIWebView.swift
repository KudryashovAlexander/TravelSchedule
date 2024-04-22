//
//  SwiftUIWebView.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 16.04.2024.
//

import SwiftUI
import WebKit

struct SwiftUIWebView: UIViewRepresentable {
    
    let url: URL?
    
    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let url = url else {
            return
        }
        let request = URLRequest(url: url)
        uiView.load(request)
    }
    
    
}
