//
//  PlayViewController.swift
//  Alias4Fun
//
//  Created by Sergei Popyvanov on 20.09.2020.
//

import UIKit

final class PlayViewController: UIViewController {

    // MARK: - ITOutlets

    @IBOutlet var roundLabel: UILabel!
    @IBOutlet var teamNameLabel: UILabel!
    @IBOutlet var roundDescriptionLabel: UILabel!

    @IBOutlet var wordLabel: UILabel!

    @IBOutlet var stopWatch: UILabel!

    // MARK: - Private Properties

    private var counter = 10
    private var timer = Timer()
    private var isPlaying = false
    private var game: Alias4FunGame
    private var roundCompletion: ((Alias4FunGame) -> Void)
    private var currentWord: String {
        didSet {
            wordLabel.text = currentWord
        }
    }

    // MARK: - Initializers

    init(game: Alias4FunGame, with roundCompletion: @escaping (Alias4FunGame) -> Void) {
        self.roundCompletion = roundCompletion
        self.game = game
        currentWord = self.game.getRoundRandomWord()!
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        stopWatch.text = String(counter)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
            isPlaying = true
        roundDescriptionLabel.text = game.currentRound.roundDescription
        wordLabel.text = currentWord
        roundLabel.text = game.currentRound.roundName
        teamNameLabel.text = game.currentTeamTurn.name
    }

    // MARK: - IBActions

    @IBAction func successButtonPressed(_ sender: Any) {
        game.success(word: currentWord)
        guard let newWord = game.getRoundRandomWord() else {
            game.newRound()
            roundCompletion(game)
            self.dismiss(animated: true)
            return
        }
        currentWord = newWord
    }

    @IBAction func changeWordButtonPressed(_ sender: Any) {
        currentWord = game.getRoundRandomWord()!
    }

    // MARK: - Private Methods

    @objc func UpdateTimer() {
        counter = counter - 1
        stopWatch.text = String(counter)
        if counter == 0 {
            timer.invalidate()
            game.changeTeam()
            roundCompletion(game)
            self.dismiss(animated: true)
        }

    }




}
