//
//  ViperList_Routers.swift
//  ViperSfera
//
//  Created by macbook on 28.11.2022.
//

import Foundation
import UIKit

protocol SferaListRouterProtocol {
    var entry: SferaListViewController? { get }
    static func startExecution() -> SferaListRouterProtocol
    
    func gotoDetailView(sfera: Sfera)
}

class SferaListRouter: SferaListRouterProtocol {

    var entry: SferaListViewController?
    
    static func startExecution() -> SferaListRouterProtocol {
        let router = SferaListRouter()
        let view = SferaListViewController()
        let interactor = SferaListInteractor()
        let presenter = SferaListPresenter()
        
        interactor.presenter = presenter
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        router.entry = view
        
        return router
    }
     
    func gotoDetailView(sfera: Sfera) {
        let detailRouter = SferaDetailRouter.createViperDetail(with: sfera)
        guard let detailView = detailRouter.entry else { return }
        guard let viewController = self.entry else { return }
        
        viewController.navigationController?.pushViewController(detailView, animated: true)
    }
}
