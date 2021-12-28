//
//  RootViewController.swift
//  ModernRIBsTutorial
//
//  Created by Ppop on 2021/12/28.
//

import ModernRIBs
import UIKit

protocol RootPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class RootViewController: UIViewController, RootPresentable, RootViewControllable {

    weak var listener: RootPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
    }
    
    func present(viewController: ViewControllable) {
        present(viewController.uiviewController, animated: true, completion: nil)
    }
}
