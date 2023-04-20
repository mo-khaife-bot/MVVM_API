//
//  TableViewModel.swift
//  MVVM_API
//
//  Created by mohomed Ali on 19/04/2023.
//

import Foundation

class TableViewModel {
    var networkManager : Networkable_Protocol
    var products_list : ProductsList?
    
    // need this closure to capture the reload table func as can only be used in Table VC as uses TableView parameter directly
    var reloadMyView: (() -> Void )?
    
    
    init(networkManager: Networkable_Protocol ) {
        self.networkManager = networkManager
    }
    
    // MARK: - getDataUsingClosures()
    // fetch the data using closure
    func getDataUsingClosures(urlString: String) {

        // function injection here
        self.networkManager.getDataFromAPIUsingClosure(urlString: urlString, completion:{ (result: Result<ProductsList, Error>) in
            switch result{
            case .success(let products):
                self.products_list = products
                self.reloadMyView?()
                print("called API using CLOSURE \(products)")

            case .failure(let error):
                print(error)
            }
            
        })
    }
    
    
}
