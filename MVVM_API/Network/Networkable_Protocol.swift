//
//  Networkable_Protocol.swift
//  MVVM_API
//
//  Created by mohomed Ali on 19/04/2023.
//

import Foundation

protocol Networkable_Protocol {
    func getDataFromAPIUsingClosure<T: Decodable>(urlString: String, completion: @escaping (Result<T, Error>) -> Void)
}

