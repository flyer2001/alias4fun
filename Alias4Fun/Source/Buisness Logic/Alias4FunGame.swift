//
//  Alias4FunGame.swift
//  Alias4Fun
//
//  Created by Sergei Popyvanov on 21.09.2020.
//

import Foundation

struct Alias4FunGame {

    // MARK: - Types

    enum Teams {
        case team1, team2

        var name: String {
            switch self {
            case .team1:
                return  "Команда 1"
            case .team2:
                return  "Команда 2"
            }
        }
    }

    enum Rounds: Int {
        case round1 = 0, round2 = 1, round3 = 2

        var roundName: String {
            switch self {
            case .round1:
                return "РАУНД 1"
            case .round2:
                return "РАУНД 2"
            case .round3:
                return "РАУНД 3"
            }
        }

        var roundDescription: String {
            switch self {
            case .round1:
                return "Объясни слово, не используя однокоренные слова"
            case .round2:
                return "Покажи слово, ничего не говоря"
            case .round3:
                return "Скажи только 1 слово, чтобы вызвать ассоциацию. Не использовать однокоренные слова"
            }
        }
    }

    // MARK: - Public Properties

    var countWords: Int {
        words.count
    }
    private(set) var currentTeamTurn: Teams = .team1
    private(set) var currentRound: Rounds = .round1
    private(set) var team1Score: [Int] = [0, 0, 0]
    private(set) var team2Score: [Int] = [0, 0, 0]

    var team1TotalScore: Int { team1Score.reduce(0, +) }
    var team2TotalScore: Int { team2Score.reduce(0, +) }

    // MARK: - Private properties

    private var words: [String] = []
    private var team1SucessedWords: [[String]] = [[], [], []] {
        didSet {
            team1Score[0] = team1SucessedWords[0].count
            team1Score[1] = team1SucessedWords[1].count
            team1Score[2] = team1SucessedWords[2].count
        }
    }
    private var team2SucessedWords: [[String]] = [[], [], []] {
        didSet {
            team2Score[0] = team2SucessedWords[0].count
            team2Score[1] = team2SucessedWords[1].count
            team2Score[2] = team2SucessedWords[2].count
        }
    }
    private var roundWords: [String] = []


    // MARK: - Public Methods

    mutating func addWords(_ word: String) {
        words.append(word)
    }

    mutating func prepareForGame() {
        roundWords = words.shuffled()
    }

    mutating func success(word: String) {
        switch currentTeamTurn {
        case .team1:
            team1SucessedWords[currentRound.rawValue].append(word)
        case .team2:
            team2SucessedWords[currentRound.rawValue].append(word)
        }
        if let deleteIndex = roundWords.firstIndex(where: { $0 == word }) {
            roundWords.remove(at: deleteIndex)
        }
    }

    mutating func getRoundRandomWord() -> String? {
        guard let lastWord = roundWords.last else {
            return nil
        }
        roundWords = roundWords.dropLast()
        roundWords.insert(lastWord, at: 0)
        return lastWord
    }


    mutating func changeTeam() {
        switch currentTeamTurn {
        case .team1:
            currentTeamTurn = .team2
        case .team2:
            currentTeamTurn = .team1
        }
    }

    func checkEndOfGame() -> Bool {
        print(currentRound)
        print(roundWords.count)
        return currentRound == .round3 && roundWords.count == 0
    }

    func getResultOfGame() -> String {
        switch team1TotalScore {
        case let score where score < team2TotalScore:
            return "Выиграла: \(Teams.team2.name)"
        case let score where score > team2TotalScore:
            return "Выиграла: \(Teams.team1.name)"
        case let score where score == team2TotalScore:
            return "Победила дружба!"
        default:
            return ""
        }
    }

    mutating func newRound() {
        switch currentRound {
        case .round1:
            currentRound = .round2
            roundWords = words.shuffled()
            currentTeamTurn = .team1
        case .round2:
            currentRound = .round3
            roundWords = words.shuffled()
            currentTeamTurn = .team1
        case .round3:
            break
        }
    }


}
