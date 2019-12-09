//
//  NYMostPopularViewModel.swift
//  XebiaTest
//
//  Created by mojave on 09/12/19.
//  Copyright © 2019 Narender. All rights reserved.
//

import Foundation

protocol ViewModelDelegate: class {
    func reloadTable(type: Int)
}

class NYMostPopularViewModel {
    
    var dataItems:MostPopularDataModel?
    var repository: NYMostPopularRepsository?
    weak var delegate: ViewModelDelegate?
    
    init() {
        repository = NYMostPopularRepsository()
    }
    
    func getNews(type: ListType) {
        guard let repo = repository else { return }
        
        repo.getMostPopular(listType: type) { [weak self](response) in
            guard let strongSelf = self else { return }
            
            switch response {
            case .success(let result):
                strongSelf.dataItems = result
                if result.status.elementsEqual("OK"){
                    strongSelf.delegate?.reloadTable(type: 1)
                }else{
                    strongSelf.delegate?.reloadTable(type: 0)
                }
            case.failure:
                strongSelf.delegate?.reloadTable(type: 0)
                break
            }
        }
    }
}
