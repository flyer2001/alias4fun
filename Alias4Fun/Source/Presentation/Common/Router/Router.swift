//
//  Router.swift
//  Alias4Fun
//
//  Created by Sergei Popyvanov on 20.09.2020.
//

import UIKit

/// Протокол роутеров
protocol Router {

    /// View Controller, с которого осуществляется навигация
    var presenter: UIViewController? { get }

}

// MARK: - Основные методы показа view controller
extension Router {

    /// Push навигация
    ///
    /// - parameter viewController: UIViewController, который покажется
    func show(viewController: UIViewController) {
        guard let presenter = presenter else {
            return
        }
        presenter.show(viewController, sender: nil)
    }

    /// Modal навигация
    ///
    /// - parameter viewController: ViewController, который покажется
    func presentModally(
        _ viewController: UIViewController,
        animated: Bool = true,
        style: UIModalPresentationStyle? = nil) {

        guard let presenter = presenter else {
            return
        }
        if let style = style {
            viewController.modalPresentationStyle = style
        }
        presenter.present(viewController, animated: animated)
    }

    /// Скрытие модального view controller
    func dismiss(animated: Bool = true) {
        presenter?.dismiss(animated: animated)
    }

    /// Скрытие view controller из navigation stack
    func pop(animated: Bool = true) {
        presenter?.navigationController?.popViewController(animated: animated)
    }

    /// Переход к корневому экрану
    func popToRoot(animated: Bool = true) {
        if let nav = presenter as? UINavigationController {
            nav.popToRootViewController(animated: animated)
        } else {
            presenter?.navigationController?.popToRootViewController(animated: animated)
        }
    }
}
