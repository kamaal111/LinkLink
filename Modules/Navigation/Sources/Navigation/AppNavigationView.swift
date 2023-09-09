//
//  AppNavigationView.swift
//
//
//  Created by Kamaal M Farah on 09/09/2023.
//

import SwiftUI
import KamaalNavigation

public struct AppNavigationView: View {
    public init() { }

    public var body: some View {
        NavigationStackView(
            stack: [Screens](),
            root: { screen in AppDetailView(screen: screen) },
            subView: { screen in AppDetailView(screen: screen, displayMode: .inline) },
            sidebar: { AppSidebar() }
        )
    }
}

#Preview {
    AppNavigationView()
}
