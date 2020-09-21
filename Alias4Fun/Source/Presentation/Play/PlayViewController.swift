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

    var counter = 60
    var timer = Timer()
    var isPlaying = false

    override func viewDidLoad() {
        super.viewDidLoad()
        stopWatch.text = String(counter)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
            isPlaying = true
    }

    // MARK: - IBActions

    @IBAction func successButtonPressed(_ sender: Any) {
    }

    @IBAction func changeWordButtonPressed(_ sender: Any) {
    }

    // MARK: - Private Methods

    @objc func UpdateTimer() {
        print(counter)
        counter = counter - 1
        stopWatch.text = String(counter)
        if counter == 0 {
            timer.invalidate()
        }
    }




}
