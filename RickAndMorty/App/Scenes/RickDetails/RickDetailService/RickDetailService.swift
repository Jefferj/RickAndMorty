//
//  RickDetailService.swift
//  RickAndMorty
//
//  Created by Jefferson Naranjo rodríguez on 6/10/22.
//

import Foundation

class RickDetailService {
    
    func getCharacters(onComplete: @escaping ([RickDTO]) -> Void,
                       onError: @escaping (String) -> Void) {
        ApiManager.shared.getCall(url: "https://rickandmortyapi.com/api/character") { response in
            switch response {
            case .success(let data):
                do {
                    if let data = data {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let result = try
                        decoder.decode(RickListDTO.self, from: data)
                        onComplete(result.results)
                    }
                }catch{
                    onError("JSON couldn'be processed")
                }
            case .failure(_):
                onError("Erro in JSON")
            }
        }
    }
}
