//
//  NetworkManager.swift
//  MVVM_API
//
//  Created by mohomed Ali on 19/04/2023.
//

import Foundation

class NetworkManager : Networkable_Protocol {
    
    // MARK: - getDataFromAPIUsingClosur
    // this method using closure sends sends API data to TableViewModel
    func getDataFromAPIUsingClosure<T: Decodable>(urlString: String, completion: @escaping (Result<T, Error>) -> Void ){
        
            guard let url = URL(string: urlString) else {return}
    
            let session = URLSession.shared
            
            let task = session.dataTask(with: url) { data, response, error in

                if let error = error{
                    print(error.localizedDescription)
                    completion(.failure(error))
                    return
                }
                

                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    print("Error for response")
                    return
                }
                
                // another error handle if for some reason can't get hold of data
                guard let data = data else {
                    print("couldn't get data from API")
                    return
                }
                

                do {

                    let productsList = try JSONDecoder().decode(ProductsList.self, from: data)
                    print(productsList)
                    completion(.success(productsList as! T))
                } catch{
                    print(error)
                }
                
            }
            //need to trigger the API andthe whole block above with resume for task obj
            task.resume()
            
        
        
    }
    
}
