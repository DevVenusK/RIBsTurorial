//
//  LoggedInInteractor.swift
//  ModernRIBsTutorial
//
//  Created by Ppop on 2022/01/13.
//

import ModernRIBs

protocol LoggedInRouting: Routing {
    func cleanupViews()
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
    func routeToTicTacToe()
    func routeToOffGame()
}

protocol LoggedInListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class LoggedInInteractor: Interactor, LoggedInInteractable {

    weak var router: LoggedInRouting?
    weak var listener: LoggedInListener?

    private let mutableScoreStream: MutableScoreStream

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    init(mutableScoreStream: MutableScoreStream) {
        self.mutableScoreStream = mutableScoreStream
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()

        router?.cleanupViews()
        // TODO: Pause any business logic.
    }
    
    // MARK: - TicTacToeListner
    func gameDidEnd(withWinner winner: PlayerType?) {
        if let winner = winner {
            mutableScoreStream.updateScore(withWinner: winner)
        }
        router?.routeToOffGame()
    }
    
    // MARK: - OffGameListener
    func startTicTacToe() {
        router?.routeToTicTacToe()
    }
}
