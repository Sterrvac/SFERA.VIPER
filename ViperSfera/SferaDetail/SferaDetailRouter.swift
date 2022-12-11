//
//  ViperDetail_Router.swift
//  ViperSfera
//
//  Created by macbook on 28.11.2022.
//

import Foundation

protocol SferaDetailRouterProtocol {
    var entry: SferaDetailViewController? { get }
    static func createViperDetail(with sfera: Sfera) -> SferaDetailRouterProtocol
}

class SferaDetailRouter: SferaDetailRouterProtocol {
    var entry: SferaDetailViewController?
    
    static func createViperDetail(with sfera: Sfera) -> SferaDetailRouterProtocol {
        let router = SferaDetailRouter()
        let view = SferaDetailViewController()
        let presenter = SferaDetailPresenter()
        let interactor = SferaDetailInteractor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.precenter = presenter
        interactor.viper = sfera
        
        router.entry = view
        
        return router
    }
    
}
