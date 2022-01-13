//
//  OffGameViewController.swift
//  ModernRIBsTutorial
//
//  Created by 김효성 on 2022/01/13.
//

import ModernRIBs
import UIKit

protocol OffGamePresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func startGame() 
}

final class OffGameViewController: UIViewController, OffGamePresentable, OffGameViewControllable {

    weak var listener: OffGamePresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        buildStartButton()
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
}

extension OffGameViewController {
    @objc private func didTapStartButton() {
        listener?.startGame()
    }
}
