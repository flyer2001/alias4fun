//
//  MainMenuViewController.swift
//  Alias4Fun
//
//  Created by Sergei Popyvanov on 20.09.2020.
//

import UIKit

class MainMenuViewController: UIViewController {

    // MARK: - Private Properties

    private var router: MainMenuRouter?

    override func viewDidLoad() {
        super.viewDidLoad()

        router = MainMenuRouter(presenter: self)
    }

    // MARK: - IBActions

    
    @IBAction private func newGamePressed(_ sender: Any) {
        router?.showAddWordsScreen()
    }

    @IBAction private func resumeGamePressed(_ sender: Any) {
    }

    @IBAction private func setupGamePressed(_ sender: Any) {
    }


}
