//
//  ViperDetail_Interactor.swift
//  ViperSfera
//
//  Created by macbook on 28.11.2022.
//

import Foundation

protocol SferaDetailInteractorProtocol {
    var precenter: SferaDetailPresenterProtocol? { get set }
    var viper: Sfera? { get set }
    
    func getViperData()
}

class SferaDetailInteractor: SferaDetailInteractorProtocol {
    var precenter: SferaDetailPresenterProtocol?
    
    var viper: Sfera?
    
    func getViperData() {
        
        precenter?.interactorUpdateData(sfera: viper)
    }
    
    
}
