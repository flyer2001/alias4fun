//
//  AddWordsViewController.swift
//  Alias4Fun
//
//  Created by Sergei Popyvanov on 20.09.2020.
//

import UIKit

class AddWordsViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet private var addWordsCountLabel: UILabel!
    @IBOutlet private var enterWordTextField: UITextField!
    @IBOutlet var startGameButton: UIButton!

    // MARK: - Private Properties

    private var router: AddWordsRouter?
    private var game = Alias4FunGame()

    override func viewDidLoad() {
        super.viewDidLoad()
        router = AddWordsRouter(presenter: self)
    }

    // MARK: - IBActionds

    @IBAction private func addWordButtonPressed(_ sender: Any) {
        guard let word = enterWordTextField.text, !word.isEmpty else { return }
        game.addWords(word)
        addWordsCountLabel.text = "Добавлено слов: \(String(game.countWords))"
        enterWordTextField.text = nil
        startGameButton.isEnabled = true
    }


    @IBAction private func gameStartPressed(_ sender: Any) {
        router?.showStatusScreen(game: game)
    }


}
