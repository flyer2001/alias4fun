//
//  StatusViewController.swift
//  Alias4Fun
//
//  Created by Sergei Popyvanov on 20.09.2020.
//

import UIKit

final class StatusViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet private var backButton: UIButton!

    @IBOutlet private var team1NameLabel: UILabel!
    @IBOutlet private var team2NameLabel: UILabel!

    @IBOutlet private var round1Team1ScoreLabel: UILabel!
    @IBOutlet private var round2Team1ScoreLabel: UILabel!
    @IBOutlet private var round3Team1ScroreLabel: UILabel!

    @IBOutlet private var round1Team2ScoreLabel: UILabel!
    @IBOutlet private var round2Team2ScoreLabel: UILabel!
    @IBOutlet private var round3Team2ScoreLabel: UILabel!

    @IBOutlet private var team1TotalScoreLabel: UILabel!
    @IBOutlet private var team2TotalScoreLabel: UILabel!

    @IBOutlet private var roundStatusLabel: UILabel!

    @IBOutlet private var teamTurnLabel: UILabel!

    @IBOutlet private var startButton: UIButton!
    @IBOutlet private var gameOverLabel: UILabel!


    // MARK: - Private Properties

    private var router: StatusViewRouter?
    private var game: Alias4FunGame

    // MARK: - Initializers

    init(game: Alias4FunGame) {
        self.game = game
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View Controller

    override func viewDidLoad() {
        super.viewDidLoad()
        game.prepareForGame()
        router = StatusViewRouter(presenter: self)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateLabel()
    }

    // MARK: - IBActions

    @IBAction func startRoundButtonPressed(_ sender: Any) {
        router?.showPlayScreen(game: game) { game in
            self.game = game
        }
        backButton.isHidden = true
    }


    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }

    // MARK: - Private Methods

    private func updateLabel() {
        team1NameLabel.text = Alias4FunGame.Teams.team1.name
        round1Team1ScoreLabel.text = String(game.team1Score[0])
        round2Team1ScoreLabel.text = String(game.team1Score[1])
        round3Team1ScroreLabel.text = String(game.team1Score[2])
        team1TotalScoreLabel.text = String(game.team1TotalScore)

        team2NameLabel.text = Alias4FunGame.Teams.team2.name
        round1Team2ScoreLabel.text = String(game.team2Score[0])
        round2Team2ScoreLabel.text = String(game.team2Score[1])
        round3Team2ScoreLabel.text = String(game.team2Score[2])
        team2TotalScoreLabel.text = String(game.team2TotalScore)

        roundStatusLabel.text = game.currentRound.roundName
        teamTurnLabel.text = game.currentTeamTurn.name

        if game.checkEndOfGame() {
            startButton.isHidden = true
            gameOverLabel.isHidden = false
            gameOverLabel.text = "ИГРА ОКОНЧЕНА \n \(game.getResultOfGame())"
        }
    }


}
