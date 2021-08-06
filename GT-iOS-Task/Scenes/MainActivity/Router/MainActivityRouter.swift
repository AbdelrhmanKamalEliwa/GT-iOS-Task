//
//  MainActivityRouter.swift
//  GT-iOS-Task
//
//  Created by Abdelrhman Eliwa on 06/08/2021.
//

import UIKit

class MainActivityRouter: MainActivityRouterProtocol {
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let view = MainActivityVC()
        let interactor = MainActivityInteractor()
        let router = MainActivityRouter()
        let presenter = MainActivityPresenter(
            view: view,
            interactor: interactor,
            router: router
        )
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
}
