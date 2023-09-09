//
//  AppDetailView.swift
//
//
//  Created by Kamaal M Farah on 09/09/2023.
//

import SwiftUI
import KamaalNavigation

struct AppDetailView: View {
    let screen: Screens
    let displayMode: DisplayMode

    init(screen: Screens, displayMode: DisplayMode? = nil) {
        self.screen = screen
        self.displayMode = displayMode ?? (screen.isSidebarItem && screen.isTabItem ? .large : .inline)
    }

    var body: some View {
        switch screen {
        case .home: Text(screen.title)
        }
    }
}

#Preview {
    AppDetailView(screen: .home)
}
