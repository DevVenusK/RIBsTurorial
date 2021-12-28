//
//  AppComponent.swift
//  ModernRIBsTutorial
//
//  Created by Ppop on 2021/12/28.
//

import ModernRIBs

class AppComponent: Component<EmptyDependency>, RootDependency {
    
    init() {
        super.init(dependency: EmptyComponent())
    }
}
