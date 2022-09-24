//
//  File.swift
//  
//
//  Created by Alish Aidarkhan on 24.09.2022.
//

import SwiftUI

public enum NavigationAnimation {
    case none //Переход без анимаций
    case custom(AnyTransition, AnyTransition) // Переход с анимацией (push, pop)
}
