//
//  SettingCoordinator.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 16.04.2024.
//

import SwiftUI

final class SettingCoordinator: ObservableObject, CoordinatorProtocol {
    
    @Published var path = NavigationPath()
        
    func push(_ page: SettingPage) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    @ViewBuilder
    func build(type: SettingPage) -> some View {
        switch type {
        case .setting:
            settingScreen()
        case .error(let errorType):
            errorScreen(errorType: errorType)
        case .webView(let urlString):
            webViewScreen(urlString: urlString)
        }
    }

    @ViewBuilder
    private func settingScreen() -> some View {
        SettingScreenView()
    }
    
    @ViewBuilder
    private func errorScreen(errorType: ErrorType) -> some View {
        ErrorView(errorType: errorType)
    }
    
    @ViewBuilder
    private func webViewScreen(urlString: String) -> some View {
        WebViewScreen(url: urlString, coordinator: self)
    }
    
    static let preview = SettingCoordinator()
    
}

enum SettingPage: Identifiable, Hashable {
    case setting
    case error(ErrorType)
    case webView(String)
    var id: String {
        switch self {
        case .setting:
            "setting"
        case .error(let errorType):
            errorType.rawValue
        case .webView( _):
            "webView"
        }
    }
}
