//
//  AppDetailView.swift
//
//
//  Created by Kamaal M Farah on 09/09/2023.
//

import SwiftUI
import KamaalUI
import LinkList
import KamaalNavigation

struct AppDetailView: View {
    let screen: Screens
    let displayMode: DisplayMode

    init(screen: Screens, displayMode: DisplayMode? = nil) {
        self.screen = screen
        self.displayMode = displayMode ?? (screen.isSidebarItem && screen.isTabItem ? .large : .inline)
    }

    var body: some View {
        KJustStack {
            switch screen {
            case .linkList: LinkListScreen()
            }
        }
        .navigationTitle(screen.title)
    }
}

#Preview {
    AppDetailView(screen: .root)
}
