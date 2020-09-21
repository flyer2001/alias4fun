//
//  AddWordsRouter.swift
//  Alias4Fun
//
//  Created by Sergei Popyvanov on 20.09.2020.
//

import UIKit

final class AddWordsRouter: Router {

    // MARK: - Public Properties

    weak var presenter: UIViewController?

    // MARK: - Initialization

    init(presenter: UIViewController) {
        self.presenter = presenter
    }

    // MARK: - Public Methods

    /// Открытие статус экрана
    func showStatusScreen(game: Alias4FunGame) {
        let vc = StatusViewController(game: game)
        presentModally(vc)
    }

}
