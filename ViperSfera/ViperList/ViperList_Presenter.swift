//
//  ViperList_Presentor.swift
//  ViperSfera
//
//  Created by macbook on 28.11.2022.
//

import Foundation


protocol ViperList_Presenter_Protocol {
    var router: ViperList_Router_Protocol? {get set}
    var view: ViperList_View_Protocol? {get set}
    var interactor: ViperList_Interactor_Protocol? {get set}
    
    func viewDidLoad()
    func interactorWithData(result: Result<[Viper], Error>)
    func tapOnDetail(_ viper: Viper)
}

class ViperList_Presenter: ViperList_Presenter_Protocol {
    var router: ViperList_Router_Protocol?
    
    var view: ViperList_View_Protocol?
    
    var interactor: ViperList_Interactor_Protocol?
    
    func viewDidLoad() {
        interactor?.getViperListData()
    }
    
    func interactorWithData(result: Result<[Viper], Error>) {
        switch(result) {
        case .success(let viper):
            view?.update(with: viper)
        case .failure(let error):
            print(error)
            view?.update(with: "Try agein later...")
        }
    }
    
    func tapOnDetail(_ viper: Viper) {
        router?.gotoDetailView(viper: viper)
    }
}
