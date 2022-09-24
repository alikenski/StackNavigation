//
//  File.swift
//  
//
//  Created by Alish Aidarkhan on 24.09.2022.
//

import Foundation
import SwiftUI

public struct StackNavigation<Content>: View where Content: View {
    @ObservedObject private var viewModel: StackNavigationVM
    var content: Content
    var transition: (push: AnyTransition, pop: AnyTransition)

    public init(
        viewModel: StackNavigationVM = StackNavigationVM(easing: .easeOut(duration: 0.4)),
        transition: NavigationAnimation,
        @ViewBuilder contentBuilder: @escaping () -> Content
    ) {
        self.viewModel = viewModel
        self.content = contentBuilder()
        switch transition {
        case .none:
            self.transition = (.identity, .identity)
        case .custom(let pushAnim, let popAnim):
            self.transition = (pushAnim, popAnim)
        }
    }

    public var body: some View {
        let isRoot = viewModel.currentScreen == nil
        return ZStack {
            switch isRoot {
            case true:
                content
                    .environmentObject(viewModel)
                    .transition(viewModel.navigationType == .push ? transition.push : transition.pop)
            case false:
                viewModel.currentScreen!.screenView
                    .environmentObject(viewModel)
                    .transition(viewModel.navigationType == .push ? transition.push : transition.pop)
            }
        }
    }
}
