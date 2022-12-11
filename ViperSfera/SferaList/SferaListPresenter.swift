//
//  ViperList_Presentor.swift
//  ViperSfera
//
//  Created by macbook on 28.11.2022.
//

import Foundation


protocol SferaListPresenterProtocol {
    
    var router: SferaListRouterProtocol? {get set}
    var view: SferaListViewProtocol? {get set}
    var interactor: SferaListInteractorProtocol? {get set}
    
    func viewDidLoad()
    func interactorWithData(result: Result<[Sfera], Error>)
    func tapOnDetail(_ sfera: Sfera)
}

class SferaListPresenter: SferaListPresenterProtocol {
    
    var router: SferaListRouterProtocol?
    
    var view: SferaListViewProtocol?
    
    var interactor: SferaListInteractorProtocol?
    
    func viewDidLoad() {
        interactor?.getViperListData()
    }
    
    func interactorWithData(result: Result<[Sfera], Error>) {
        switch(result) {
        case .success(let sfera):
            view?.update(with: sfera)
        case .failure(let error):
            print(error)
            view?.update(with: "Try agein later...")
        }
    }
    
    func tapOnDetail(_ sfera: Sfera) {
        router?.gotoDetailView(sfera: sfera)
    }
}
