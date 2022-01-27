//
//  LoggedInBuilder.swift
//  ModernRIBsTutorial
//
//  Created by Ppop on 2022/01/13.
//

import ModernRIBs

protocol LoggedInDependency: Dependency {
    // TODO: Make sure to convert the variable into lower-camelcase.
    var loggedInViewController: LoggedInViewControllable { get }
    // TODO: Declare the set of dependencies required by this RIB, but won't be
    // created by this RIB.
}

final class LoggedInComponent: Component<LoggedInDependency>, OffGameDependency, TicTacToeDependency {
    let player1Name: String
    let player2Name: String
    var scoreStream: ScoreStream {
        return mutableScoreStream
    }
    
    init(dependency: LoggedInDependency,
         player1Name: String,
         player2Name: String) {
        self.player1Name = player1Name
        self.player2Name = player2Name
        super.init(dependency: dependency)
    }
    
    var mutableScoreStream: MutableScoreStream {
        return shared { ScoreStreamImpl() }
    }
    
    // TODO: Make sure to convert the variable into lower-camelcase.
    fileprivate var loggedInViewController: LoggedInViewControllable {
        return dependency.loggedInViewController
    }

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol LoggedInBuildable: Buildable {
    func build(withListener listener: LoggedInListener,
               player1Name: String,
               player2Name: String) -> LoggedInRouting
}

final class LoggedInBuilder: Builder<LoggedInDependency>, LoggedInBuildable {

    override init(dependency: LoggedInDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: LoggedInListener,
               player1Name: String,
               player2Name: String) -> LoggedInRouting {
        let component = LoggedInComponent(dependency: dependency,
                                          player1Name: player1Name,
                                          player2Name: player2Name)
        let interactor = LoggedInInteractor(mutableScoreStream: component.mutableScoreStream)
        interactor.listener = listener
        
        let offGameBuilder = OffGameBuilder(dependency: component)
        let ticTacToeBuilder = TicTacToeBuilder(dependency: component)
        return LoggedInRouter(interactor: interactor,
                              viewController: component.loggedInViewController,
                              offGameBuilder: offGameBuilder,
                              ticTacToeBulider: ticTacToeBuilder)
    }
}


protocol ViewModelProtocol {
    func name(_ name: String) -> String
}

struct ViewModel {
    func name(_ name: String) -> String {
        return name
    }
}
