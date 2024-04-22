//
//  WebViewScreen.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 16.04.2024.
//

import SwiftUI

struct WebViewScreen: View {
    
    let url: String
    var coordinator: CoordinatorProtocol?
    
    init(url: String, coordinator: CoordinatorProtocol? = nil) {
        self.url = url
        self.coordinator = coordinator
    }
    
    var body: some View {
        ZStack {
            Color.tsWhiteTopic.ignoresSafeArea()
            SwiftUIWebView(url: URL(string: url))
                .modifyNavigation(title: L.Settings.politycy) {
                    coordinator?.pop()
                }
        }
    }
}

#Preview {
    WebViewScreen(url:"https://yandex.ru/legal/confidential/")
}
