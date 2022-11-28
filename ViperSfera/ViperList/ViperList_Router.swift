//
//  ViperList_Routers.swift
//  ViperSfera
//
//  Created by macbook on 28.11.2022.
//

import Foundation
import UIKit

protocol ViperList_Router_Protocol {
    var entry: ViperListViewController? { get }
    static func startExecution() -> ViperList_Router_Protocol
    
    func gotoDetailView(viper: Viper)
}

class ViperList_Router: ViperList_Router_Protocol {

    var entry: ViperListViewController?
    
    static func startExecution() -> ViperList_Router_Protocol {
        let router = ViperList_Router()
        let view = ViperListViewController()
        let presenter = ViperList_Presenter()
        let interactor = ViperList_Interactor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        router.entry = view
        
        return router
    }
     
    func gotoDetailView(viper: Viper) {
        let detailRouter = ViperDetail_Router.createViperDetail(with: viper)
        guard let detailView = detailRouter.entry else { return }
        guard let viewController = self.entry else { return }
        
        viewController.navigationController?.pushViewController(detailView, animated: true)
    }
}
