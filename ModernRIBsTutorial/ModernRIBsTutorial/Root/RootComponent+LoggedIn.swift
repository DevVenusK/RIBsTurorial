//
//  RootComponent+LoggedIn.swift
//  ModernRIBsTutorial
//
//  Created by Ppop on 2022/01/13.
//

import ModernRIBs

/// The dependencies needed from the parent scope of Root to provide for the LoggedIn scope.
// TODO: Update RootDependency protocol to inherit this protocol.
protocol RootDependencyLoggedIn: Dependency {
    // TODO: Declare dependencies needed from the parent scope of Root to provide dependencies
    // for the LoggedIn scope.
}

extension RootComponent: LoggedInDependency {
    var loggedInViewController: LoggedInViewControllable {
        return rootViewController
    }
    // TODO: Implement properties to provide for LoggedIn scope.
}
