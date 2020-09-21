//
//  StatusViewController.swift
//  Alias4Fun
//
//  Created by Sergei Popyvanov on 20.09.2020.
//

import UIKit

final class StatusViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet var team1NameLabel: UILabel!
    @IBOutlet var team2NameLabel: UILabel!

    @IBOutlet var round1Team1ScoreLabel: UILabel!
    @IBOutlet var round2Team1ScoreLabel: UILabel!
    @IBOutlet var round3Team1ScroreLabel: UILabel!

    @IBOutlet var round1Team2ScoreLabel: UILabel!
    @IBOutlet var round2Team2ScoreLabel: UILabel!
    @IBOutlet var round3Team2ScoreLabel: UILabel!

    @IBOutlet var team1TotalScoreLabel: UILabel!
    @IBOutlet var team2TotalScoreLabel: UILabel!

    @IBOutlet var roundStatusLabel: UILabel!

    @IBOutlet var teamTurnLabel: UILabel!

    // MARK: - Private Properties

    private var router: StatusViewRouter?


    override func viewDidLoad() {
        super.viewDidLoad()

        router = StatusViewRouter(presenter: self)
    }

    @IBAction func startRoundButtonPressed(_ sender: Any) {
        router?.showPlayScreen()
    }


}
