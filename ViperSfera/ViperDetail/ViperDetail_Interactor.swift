//
//  ViperDetail_Interactor.swift
//  ViperSfera
//
//  Created by macbook on 28.11.2022.
//

import Foundation

protocol ViperDetail_Interactor_Protocol {
    var precenter: ViperDetail_Presenter_Protocol? { get set }
    var viper: Viper? { get set }
    
    func getViperData()
}

class ViperDetail_Interactor: ViperDetail_Interactor_Protocol {
    var precenter: ViperDetail_Presenter_Protocol?
    
    var viper: Viper?
    
    func getViperData() {
        
        precenter?.interactorUpdateData(viper: viper)
    }
    
    
}
