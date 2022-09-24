//
//  File.swift
//  
//
//  Created by Alish Aidarkhan on 24.09.2022.
//

import Foundation
import SwiftUI

//Описание самого экрана для нашего StackView
struct Screen: Identifiable, Equatable {
    let id: String
    let screenView: AnyView

    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}
