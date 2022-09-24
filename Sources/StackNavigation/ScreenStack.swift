//
//  File.swift
//  
//
//  Created by Alish Aidarkhan on 24.09.2022.
//

struct ScreensStack {
    
    //Stack наших скринов
    var screens: [Screen] = []

    //Самый последний экран
    func top() -> Screen? {
        screens.last
    }

    //Добавление экрана в стэк
    mutating func push(newScreen: Screen) {
        screens.append(newScreen)
    }

    //Удаление последнего экрана со стэка
    mutating func popPrev() {
        _ = screens.popLast()
    }

    //удаление всех элементов и переход на root screen
    mutating func popToRoot() {
        screens.removeAll()
    }
}
