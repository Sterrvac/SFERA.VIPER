//
//  ViperList_Interactor.swift
//  ViperSfera
//
//  Created by macbook on 28.11.2022.
//

import Foundation

protocol ViperList_Interactor_Protocol {
    var presenter: ViperList_Presenter_Protocol? {get set}
    
    func getViperListData()
}

class ViperList_Interactor: ViperList_Interactor_Protocol {
    var presenter: ViperList_Presenter_Protocol?
    
    func getViperListData() {
        
        guard let url = URL(string: "https://sample-api-nine.vercel.app/cartoons2D.json") else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                self?.presenter?.interactorWithData(result: .failure(NetworkError.serverError))
                return
            }
            
            do {
                let viper = try JSONDecoder().decode([Viper].self, from: data)
                self?.presenter?.interactorWithData(result: .success(viper))
            } catch {
                self?.presenter?.interactorWithData(result: .failure(NetworkError.deodingError))
            }
        }
        
        task.resume()
    }
}
