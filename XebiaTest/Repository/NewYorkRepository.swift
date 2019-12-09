//
//  NewYorkRepository.swift
//  XebiaTest
//
//  Created by mojave on 09/12/19.
//  Copyright © 2019 Narender. All rights reserved.
//

import Foundation

enum  ItemDataResponse {
    case success(result: MostPopularDataModel)
    case failure
}

class NYMostPopularRepsository: BaseService {
    
    func getMostPopular(listType: ListType, completion: @escaping (ItemDataResponse) -> Void ) {
        let endPoint = setEndPoint(type: listType)
        super.callEndPoint(endPoint:endPoint.rawValue) { [weak self] (response) in
            guard let strongSelf = self else { return }
            switch response {
            case .success(let result):
                strongSelf.parseResult(result: result, completion: completion)
                break
            default:
                completion(.failure)
                break
            }
            
        }
    }
    
    private func parseResult(result: JsonDictionay,completion: @escaping (ItemDataResponse) -> Void) {
        guard let data = MostPopularDataModel(json: result) else {
            completion(.failure)
            return
        }
        completion(.success(result: data))
    }
    
    private func setEndPoint(type: ListType) -> NYTEndPoints {
        var endPoint: NYTEndPoints
        switch type {
        case .oneDay:
            endPoint = .getLast1Days
        case .sevenDays:
            endPoint = .getLast7Days
        case .thirtyDays:
            endPoint = .getLast30Days
        }
        return endPoint
    }
    
}
