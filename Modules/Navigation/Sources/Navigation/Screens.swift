//
//  Screens.swift
//  
//
//  Created by Kamaal M Farah on 09/09/2023.
//

import Foundation
import KamaalNavigation

enum Screens: CaseIterable, Identifiable, NavigatorStackValue {
    case home

    var id: Self { self }

    var isTabItem: Bool {
        switch self {
        case .home: true
        }
    }

    var isSidebarItem: Bool {
        switch self {
        case .home: true
        }
    }

    var title: String {
        switch self {
        case .home: "Home"
        }
    }

    var imageSystemName: String {
        switch self {
        case .home: "house.fill"
        }
    }

    static var root: Screens = .home
}
