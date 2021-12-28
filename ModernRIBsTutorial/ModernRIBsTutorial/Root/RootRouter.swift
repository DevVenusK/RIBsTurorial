//
//  RootRouter.swift
//  ModernRIBsTutorial
//
//  Created by Ppop on 2021/12/28.
//

import ModernRIBs

protocol RootInteractable: Interactable, LoggedOutListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    func present(viewController: ViewControllable)
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {

    init(interactor: RootInteractable,
                  viewController: RootViewControllable,
                  loggedOutBuilder: LoggedOutBuildable) {
        self.loggedOutBuilder = loggedOutBuilder
        super.init(interactor: interactor,
                   viewController: viewController)
        interactor.router = self
    }
    
    override func didLoad() {
        super.didLoad()
    
        let loggedOut = loggedOutBuilder.build(withListener: interactor)
        self.loggedOut = loggedOut
        attachChild(loggedOut)
        viewController.present(viewController: loggedOut.viewControllable)
    }
    
    // MARK: - Private
    
    private let loggedOutBuilder: LoggedOutBuildable
    
    private var loggedOut: ViewableRouting?
}
