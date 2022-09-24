//
//  StackNavigationVM.swift
//  
//
//  Created by Alish Aidarkhan on 24.09.2022.
//

import Foundation
import SwiftUI

public class StackNavigationVM: ObservableObject {
    private let easing: Animation

    var navigationType: NavigationType = .push

    @Published var currentScreen: Screen?

    var screensStack = ScreensStack() {
        didSet {
            currentScreen = screensStack.top()
        }
    }

    public init(easing: Animation) {
        self.easing = easing
    }

    public func push<S: View>(view: S) {
        withAnimation(easing) {
            navigationType = .push
            let screen = Screen(id: UUID().uuidString, screenView: AnyView(view))
            screensStack.push(newScreen: screen)
        }
    }

    public func pop(destination: PopDestination = .prev) {
        withAnimation(easing) {
            switch destination {
            case .prev:
                navigationType = .pop
                screensStack.popPrev()
            case .root:
                navigationType = .pop
                screensStack.popToRoot()
            }
        }
    }
}
