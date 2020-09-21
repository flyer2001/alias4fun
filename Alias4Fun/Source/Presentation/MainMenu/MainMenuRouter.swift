//
//  MainMenuRouter.swift
//  Alias4Fun
//
//  Created by Sergei Popyvanov on 20.09.2020.
//

import UIKit

final class MainMenuRouter: Router {

    // MARK: - Public Properties

    weak var presenter: UIViewController?

    // MARK: - Initialization

    init(presenter: UIViewController) {
        self.presenter = presenter
    }

    // MARK: - Public Methods

    /// Открытие ввода слов
    func showAddWordsScreen() {
        let vc = AddWordsViewController()
        presentModally(vc)
    }

}
