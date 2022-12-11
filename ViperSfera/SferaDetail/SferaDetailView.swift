//
//  ViperDetail_View.swift
//  ViperSfera
//
//  Created by macbook on 28.11.2022.
//

import Foundation
import UIKit

protocol SferaDetailViewProtocol {
    var presenter: SferaDetailPresenterProtocol? { get set }
    
    func update(with sfera: Sfera)
    func update(with error: String)
}


class SferaDetailViewController: UIViewController, SferaDetailViewProtocol {
    
    //MARK: - COMPONENT
    let stackView = UIStackView()
    let label = UILabel()
    let imageView = UIImageView()
    
    //MARK: - PROPERTY
    var presenter: SferaDetailPresenterProtocol?
    
    //MARK: - LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        presenter?.viewDidLoad()
    }
}

extension SferaDetailViewController {
    func style() {
        view.backgroundColor = .white
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Dummy"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.textAlignment = .center
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
    }
    
    func layout() {
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(imageView)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}
// MARK: - ViperDetail_View_Protocol
extension SferaDetailViewController {
    func update(with sfera: Sfera) {
        label.textColor = .black
        label.text = sfera.title
        
        if let url = URL(string: sfera.image) {
            imageView.load(url: url)
            imageView.isHidden = false
        } else {
            imageView.isHidden = true
        }
    }
    
    func update(with error: String) {
        imageView.isHidden = true
        label.text = error
        label.textColor = .red
    }
}
