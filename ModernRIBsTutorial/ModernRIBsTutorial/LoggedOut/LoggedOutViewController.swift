//
//  LoggedOutViewController.swift
//  ModernRIBsTutorial
//
//  Created by Ppop on 2021/12/28.
//

import ModernRIBs
import UIKit

protocol LoggedOutPresentableListener: AnyObject {
    func login(withPlayerName player1Name: String?, _ player2Name: String?)
}

final class LoggedOutViewController: UIViewController, LoggedOutPresentable, LoggedOutViewControllable {

    weak var listener: LoggedOutPresentableListener?
    
    private var player1Field: UITextField?
    private var player2Field: UITextField?

    override func viewDidLoad() {
        super.viewDidLoad()
        let playerFields = buildPlayerFields()
        buildLoginButton(withPlayerField: playerFields.plyaer1Field,
                         playerFields.player2Field)
    }
}

extension LoggedOutViewController {
    @objc private func didTapLoginButton() {
        listener?.login(withPlayerName: player1Field?.text, player2Field?.text)
    }
}

extension LoggedOutViewController {
    private func buildPlayerFields() -> (plyaer1Field: UITextField,
                                         player2Field: UITextField) {
        let player1Field: UITextField = {
            let textField = UITextField()
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.borderStyle = .line
            textField.placeholder = "Player 1 name"
            return textField
        }()
        
        self.player1Field = player1Field
        view.addSubview(player1Field)
        
        [player1Field.topAnchor.constraint(equalTo: view.topAnchor,
                                           constant: 100),
         player1Field.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                               constant: 40),
         player1Field.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                constant: -40),
         player1Field.heightAnchor.constraint(equalToConstant: 40)]
            .forEach { $0.isActive = true }
        
        let player2Field: UITextField = {
            let textField = UITextField()
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.borderStyle = .line
            textField.placeholder = "Player 2 name"
            return textField
        }()
        
        self.player2Field = player2Field
        view.addSubview(player2Field)
        
        [player2Field.topAnchor.constraint(equalTo: player1Field.bottomAnchor,
                                           constant: 20),
         player2Field.leadingAnchor.constraint(equalTo: player1Field.leadingAnchor),
         player2Field.trailingAnchor.constraint(equalTo: player1Field.trailingAnchor),
         player2Field.heightAnchor.constraint(equalTo: player1Field.heightAnchor)]
            .forEach { $0.isActive = true }
        
        return (player1Field, player2Field)
    }
    
    private func buildLoginButton(withPlayerField player1Field: UITextField,
                                  _ player2Field: UITextField) {
        let loginButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("Login",
                            for: .normal)
            button.setTitleColor(UIColor.white,
                                 for: .normal)
            button.backgroundColor = UIColor.black
            button.addTarget(self,
                             action: #selector(didTapLoginButton)
                             , for: .touchUpInside)
            return button
        }()
        
        view.addSubview(loginButton)
        
        [loginButton.topAnchor.constraint(equalTo: player2Field.bottomAnchor,
                                          constant: 20),
         loginButton.leadingAnchor.constraint(equalTo: player1Field.leadingAnchor),
         loginButton.trailingAnchor.constraint(equalTo: player1Field.trailingAnchor),
         loginButton.heightAnchor.constraint(equalTo: player1Field.heightAnchor)]
            .forEach { $0.isActive = true }
    }
}
