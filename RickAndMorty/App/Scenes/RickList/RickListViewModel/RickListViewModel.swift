//
//  RickListViewModel.swift
//  RickAndMorty
//
//  Created by Jefferson Naranjo rodríguez on 5/10/22.
//

import Foundation

class RickListViewModel {
    private var service : RickListService
    var characters = [RickDTO]()
    
    init(service: RickListService) {
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
