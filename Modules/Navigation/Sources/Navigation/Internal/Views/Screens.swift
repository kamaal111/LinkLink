//
//  Screens.swift
//  
//
//  Created by Kamaal M Farah on 09/09/2023.
//

import Foundation
import KamaalNavigation

enum Screens: CaseIterable, Identifiable, NavigatorStackValue {
    case linkList

    var id: Self { self }

    var isTabItem: Bool {
        switch self {
        case .linkList: true
        }
    }

    var isSidebarItem: Bool {
        switch self {
        case .linkList: true
        }
    }

    var title: String {
        switch self {
        case .linkList: NSLocalizedString("Links", bundle: .module, comment: "")
        }
    }

    var imageSystemName: String {
        switch self {
        case .linkList: "list.triangle"
        }
    }

    static var root: Screens = .linkList
}
