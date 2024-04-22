//
//  NavigationTittleModify.swift
//  TravelSchedule
//
//  Created by Александр Кудряшов on 16.04.2024.
//

import Foundation

import SwiftUI

struct NavigationTitleModify: ViewModifier {
    
    var title: String
    var backAction: () -> Void
    
    init(title: String, backAction: @escaping () -> Void) {
        self.title = title
        self.backAction = backAction
    }
    
    func body(content: Content) -> some View {
        content
            .navigationTitle(title)
            .navigationBarBackButtonHidden(true)
            .background(Color.tsWhiteTopic.edgesIgnoringSafeArea(.bottom))
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Image(.chevronLeft)
                        .onTapGesture {
                            backAction()
                        }
                }
            }
            .toolbar(.hidden, for: .tabBar)
    }
}

extension View {
    func modifyNavigation(title: String, completion: @escaping () -> Void) -> some View { 
        self.modifier(NavigationTitleModify(title: title, backAction: {
            completion()
        }))
    }
}
