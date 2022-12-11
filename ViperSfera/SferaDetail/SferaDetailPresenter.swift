//
//  ViperDetail_Presenter.swift
//  ViperSfera
//
//  Created by macbook on 28.11.2022.
//

import Foundation

protocol SferaDetailPresenterProtocol {
    var router: SferaDetailRouterProtocol? { get set }
    var interactor: SferaDetailInteractorProtocol? { get set }
    var view: SferaDetailViewProtocol? { get set }
    
    func interactorUpdateData(sfera: Sfera?)
    func viewDidLoad()
    
}

class SferaDetailPresenter: SferaDetailPresenterProtocol {
    var router: SferaDetailRouterProtocol?
    
    var interactor: SferaDetailInteractorProtocol?
    
    var view: SferaDetailViewProtocol?
    
    func interactorUpdateData(sfera: Sfera?) {
        if let sfera = sfera {
            view?.update(with: sfera)
        } else {
            view?.update(with: "No data")
        }

    }
    
    func viewDidLoad() {
        interactor?.getViperData()
    }
    
    
}
