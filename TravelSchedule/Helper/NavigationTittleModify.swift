//
//  NavigationTittleModify.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 16.04.2024.
//

import Foundation

import SwiftUI

struct NavigationTitleModify: ViewModifier {
    
    @EnvironmentObject private var coordinator: Coordinator
    var title: String
    
    func body(content: Content) -> some View {
        content
            .navigationTitle(title)
            .navigationBarBackButtonHidden(true)
            .background(Color.tsWhiteTopic.edgesIgnoringSafeArea(.bottom))
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Image(.chevronLeft)
                        .onTapGesture {
                            coordinator.pop()
                        }
                }
            }
            .toolbar(.hidden, for: .tabBar)

    }
}

extension View {
    func modifyNavigation(title: String) -> some View {
        self.modifier(NavigationTitleModify(title: title))
    }
}
