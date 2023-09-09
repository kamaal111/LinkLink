//
//  LinkListScreen.swift
//
//
//  Created by Kamaal M Farah on 09/09/2023.
//

import SwiftUI
import KamaalUI
import KamaalExtensions

struct AppLink: Identifiable, Hashable {
    var id: UUID
    var value: URL
}

public struct LinkListScreen: View {
    @State private var viewModel = ViewModel()
    @FocusState private var focusedField: FocusFields?

    public init() { }

    enum FocusFields {
        case newLink
    }

    public var body: some View {
        VStack {
            HStack {
                KFloatingTextField(
                    text: $viewModel.newLink,
                    title: NSLocalizedString("New link", bundle: .module, comment: "")
                )
                .onSubmit({ viewModel.addLink() })
                .focused($focusedField, equals: .newLink)
                Button(action: { viewModel.addLink() }) {
                    Text("Add", bundle: .module)
                }
                .disabled(!viewModel.newLinkIsValid)
                .padding(.bottom, -12)
            }
            ForEach(viewModel.links) { links in
                Text(links.value.absoluteString)
            }
        }
        .padding()
        .ktakeSizeEagerly(alignment: .top)
        .onAppear(perform: handleOnAppear)
    }

    private func handleOnAppear() { 
        focusedField = .newLink
    }
}

extension LinkListScreen {
    @Observable
    final class ViewModel {
        var newLink = ""
        var links: [AppLink] = []

        var newLinkIsValid: Bool {
            URL(string: newLink)?.isValid == true
        }

        @MainActor
        func addLink() {
            guard newLinkIsValid else {
                assertionFailure("This should have been checked already")
                return
            }

            withAnimation {
                links = links.prepended(AppLink(id: UUID(), value: URL(string: newLink)!))
                newLink = ""
            }
        }
    }
}

#Preview {
    LinkListScreen()
}
