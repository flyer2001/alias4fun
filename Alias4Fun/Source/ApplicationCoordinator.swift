//
//  ApplicationCoordinator.swift
//  Alias4Fun
//
//  Created by Sergei Popyvanov on 20.09.2020.
//

import UIKit

// Контроллер управляющий запуском приложения
final class ApplicationCoordinator {

    // MARK: - Public methods

    ///Выполняет первоначальную настройку приложения
    static func start() {
        showMainMenuScreen()
    }


    private static func showMainMenuScreen() {
        UIWindow.keyWindowTransit(to: MainMenuViewController())
    }

}

