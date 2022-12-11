//
//  ViperList_Interactor.swift
//  ViperSfera
//
//  Created by macbook on 28.11.2022.
//

import Foundation

protocol SferaListInteractorProtocol {
    var presenter: SferaListPresenterProtocol? {get set}
    
    func getViperListData()
}

class SferaListInteractor: SferaListInteractorProtocol {
    var presenter: SferaListPresenterProtocol?
    
    func getViperListData() {
        
        guard let url = URL(string: "https://sample-api-nine.vercel.app/cartoons2D.json") else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                self?.presenter?.interactorWithData(result: .failure(NetworkError.serverError))
                return
            }
            
            do {
                let sfera = try JSONDecoder().decode([Sfera].self, from: data)
                self?.presenter?.interactorWithData(result: .success(sfera))
            } catch {
                self?.presenter?.interactorWithData(result: .failure(NetworkError.deodingError))
            }
        }
        
        task.resume()
    }
}
