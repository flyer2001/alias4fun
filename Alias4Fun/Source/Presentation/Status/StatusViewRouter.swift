//
//  StatusViewRouter.swift
//  Alias4Fun
//
//  Created by Sergei Popyvanov on 20.09.2020.
//

import UIKit

final class StatusViewRouter: Router {

    // MARK: - Public Properties

    weak var presenter: UIViewController?

    // MARK: - Initialization

    init(presenter: UIViewController) {
        self.presenter = presenter
    }

    // MARK: - Public Methods

    /// Открытие статус экрана
    func showPlayScreen(game: Alias4FunGame, with roundCompletion: @escaping (Alias4FunGame) -> Void) {
        let vc = PlayViewController(game: game, with: roundCompletion)
        presentModally(vc)
    }

}
