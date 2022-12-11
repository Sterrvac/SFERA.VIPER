//
//  ViperFavorite_Presenter.swift
//  ViperSfera
//
//  Created by macbook on 10.12.2022.
//

import Foundation
import UIKit

protocol SferaFavoritePresenterProtocol {
    var router: SferaDetailRouterProtocol? { get set }
    var interactor: SferaDetailInteractorProtocol? { get set }
    var view: SferaDetailViewProtocol? { get set }
    
    func viewDidLoad()
}

class SferaFavoritePresenter: SferaFavoritePresenterProtocol {
    var router: SferaDetailRouterProtocol?
    
    var interactor: SferaDetailInteractorProtocol?
    
    var view: SferaDetailViewProtocol?
    
    func viewDidLoad() {
        
    }
    
}
