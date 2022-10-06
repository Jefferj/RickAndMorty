//
//  RickDetailViewModel.swift
//  RickAndMorty
//
//  Created by Jefferson Naranjo rodríguez on 6/10/22.
//

import Foundation

class RickDetailViewModel {
    private var service : RickDetailService
    var characters = [RickDTO]()
    
    init(service: RickDetailService) {
        self.service = service
    }
    
    func getCharacters(onComplete: @escaping () -> Void){
        service.getCharacters { results in
            self.characters = results
            onComplete()
        } onError: { error in
            print(error)
        }

    }
}
