//
//  ViperDetail_Router.swift
//  ViperSfera
//
//  Created by macbook on 28.11.2022.
//

import Foundation

protocol ViperDetail_Router_Protocol {
    var entry: ViperDetailViewController? { get }
    static func createViperDetail(with viper: Viper) -> ViperDetail_Router_Protocol
}

class ViperDetail_Router: ViperDetail_Router_Protocol {
    var entry: ViperDetailViewController?
    
    static func createViperDetail(with viper: Viper) -> ViperDetail_Router_Protocol {
        let router = ViperDetail_Router()
        let view = ViperDetailViewController()
        let presenter = ViperDetail_Presenter()
        let interactor = ViperDetail_Interactor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.precenter = presenter
        interactor.viper = viper
        
        router.entry = view
        
        return router
    }
    
}
