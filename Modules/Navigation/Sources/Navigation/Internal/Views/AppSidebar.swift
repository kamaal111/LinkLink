//
//  AppSidebar.swift
//
//
//  Created by Kamaal M Farah on 09/09/2023.
//

import SwiftUI
import KamaalNavigation

struct AppSidebar: View {
    var body: some View {
        List {
            Section(NSLocalizedString("Content", bundle: .module, comment: "")) {
                ForEach(Screens.allCases.filter(\.isSidebarItem)) { screen in
                    StackNavigationChangeStackButton(destination: screen) {
                        Label(screen.title, systemImage: screen.imageSystemName)
                            .foregroundColor(.accentColor)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        #if os(macOS)
        .frame(minWidth: 160)
        .toolbar(content: {
            Button(action: toggleSidebar) {
                Label(NSLocalizedString("Toggle sidebar", bundle: .module, comment: ""), systemImage: "sidebar.left")
                    .foregroundColor(.accentColor)
            }
            .help(NSLocalizedString("Toggle sidebar", bundle: .module, comment: ""))
        })
        #endif
    }

    #if os(macOS)
    private func toggleSidebar() {
        guard let firstResponder = NSApp.keyWindow?.firstResponder else { return }
        firstResponder.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
    }
    #endif
}

#Preview {
    AppSidebar()
}
