//
//  OffGameViewController.swift
//  ModernRIBsTutorial
//
//  Created by 김효성 on 2022/01/13.
//

import ModernRIBs
import UIKit

protocol OffGamePresentableListener: AnyObject {
    func startGame()
}

final class OffGameViewController: UIViewController, OffGamePresentable, OffGameViewControllable {

    weak var listener: OffGamePresentableListener?
    private let player1Name: String
    private let player2Name: String

    private var player1Label: UILabel?
    private var player2Label: UILabel?
    private var score: Score?

    init(player1Name: String, player2Name: String) {
        self.player1Name = player1Name
        self.player2Name = player2Name
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("Method is not supported")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.yellow
        buildStartButton()
        buildPlayerLabels()
    }
    
    func set(score: Score) {
        self.score = score
    }
}

extension OffGameViewController {
    private func buildStartButton() {
        let startButton = UIButton()
        startButton.addTarget(self, action: #selector(didTapStartButton), for: .touchUpInside)
        view.addSubview(startButton)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        
        [startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
         startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
         startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
         startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
         startButton.heightAnchor.constraint(equalToConstant: 100)]
            .forEach { $0.isActive = true }
        
        startButton.setTitle("Start Game", for: .normal)
        startButton.setTitleColor(UIColor.white, for: .normal)
        startButton.backgroundColor = UIColor.black
    }
    
    private func buildPlayerLabels() {
        let labelBuilder: (UIColor, String) -> UILabel = { (color: UIColor, text: String) in
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 35)
            label.backgroundColor = UIColor.clear
            label.textColor = color
            label.textAlignment = .center
            label.text = text
            return label
        }
        
        let player1Label = labelBuilder(UIColor.blue, player1Name)
        self.player1Label = player1Label

        view.addSubview(player1Label)
        player1Label.translatesAutoresizingMaskIntoConstraints = false
        
        [player1Label.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
         player1Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
         player1Label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
         player1Label.heightAnchor.constraint(equalToConstant: 40)]
            .forEach { $0.isActive = true }
        
        let vsLabel = UILabel()
        vsLabel.font = UIFont.systemFont(ofSize: 25)
        vsLabel.backgroundColor = UIColor.clear
        vsLabel.textColor = UIColor.darkGray
        vsLabel.textAlignment = .center
        vsLabel.text = "vs"
        vsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(vsLabel)
        
        [vsLabel.topAnchor.constraint(equalTo: player1Label.bottomAnchor, constant: 10),
         vsLabel.leadingAnchor.constraint(equalTo: player1Label.leadingAnchor),
         vsLabel.trailingAnchor.constraint(equalTo: player1Label.trailingAnchor),
         vsLabel.heightAnchor.constraint(equalToConstant: 20)]
            .forEach { $0.isActive = true }
        
        let player2Label = labelBuilder(UIColor.red, player2Name)
        self.player2Label = player2Label
        
        view.addSubview(player2Label)
        player2Label.translatesAutoresizingMaskIntoConstraints = false
        
        [player2Label.topAnchor.constraint(equalTo: vsLabel.bottomAnchor, constant: 10),
         player2Label.leadingAnchor.constraint(equalTo: player1Label.leadingAnchor),
         player2Label.trailingAnchor.constraint(equalTo: player1Label.trailingAnchor),
         player2Label.heightAnchor.constraint(equalTo: player1Label.heightAnchor)]
            .forEach { $0.isActive = true }
    }
}

extension OffGameViewController {
    @objc private func didTapStartButton() {
        listener?.startGame()
    }
}
