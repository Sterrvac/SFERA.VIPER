//
//  ViperDetail_Presenter.swift
//  ViperSfera
//
//  Created by macbook on 28.11.2022.
//

import Foundation

protocol ViperDetail_Presenter_Protocol {
    var router: ViperDetail_Router_Protocol? { get set }
    var interactor: ViperDetail_Interactor_Protocol? { get set }
    var view: ViperDetail_View_Protocol? { get set }
    
    func interactorUpdateData(viper: Viper?)
    func viewDidLoad()
    
}

class ViperDetail_Presenter: ViperDetail_Presenter_Protocol {
    var router: ViperDetail_Router_Protocol?
    
    var interactor: ViperDetail_Interactor_Protocol?
    
    var view: ViperDetail_View_Protocol?
    
    func interactorUpdateData(viper: Viper?) {
        if let viper = viper {
            view?.update(with: viper)
        } else {
            view?.update(with: "No data")
        }

    }
    
    func viewDidLoad() {
        interactor?.getViperData()
    }
    
    
}
