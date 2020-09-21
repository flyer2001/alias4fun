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

    // MARK: - Private Properties

    private var router: AddWordsRouter?


    override func viewDidLoad() {
        super.viewDidLoad()
        router = AddWordsRouter(presenter: self)
    }

    // MARK: - IBActionds

    @IBAction private func addWordButtonPressed(_ sender: Any) {
    }


    @IBAction private func gameStartPressed(_ sender: Any) {
        router?.showStatusScreen()
    }


}
