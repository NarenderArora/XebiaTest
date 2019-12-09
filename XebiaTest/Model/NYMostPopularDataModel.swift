//
//  NYMostPopularDataModel.swift
//  XebiaTest
//
//  Created by mojave on 09/12/19.
//  Copyright © 2019 Narender. All rights reserved.
//

import Foundation

protocol CreateFromArray {
    
    init?(json: JsonDictionay )
}

extension CreateFromArray {
    
    ///Create array of items from json
    static func createRequiredInstances(from json: JsonDictionay , key:String) -> [Self]? {
        guard let jsonDictionaries = json[key] as? [[String: Any]] else { return nil }
        var array = [Self]()
        for jsonDictionary in jsonDictionaries {
            guard let instance = Self.init(json: jsonDictionary) else { return nil }
            array.append(instance)
        }
        return array
    }
}

struct NewsDataModel:CreateFromArray {
    ///title of the news
    let title    : String
    ///abstract from the news
    let abstract  : String
    ///author of the news
    let byline  : String
    ///published date of the news
    let published_date : String
    ///news Media urls of the news
    let mediaUrl : [String]?
    
    ///Intialize funtion of datamodel
    init(title:String,abstract:String,published_date:String,byline:String,mediaUrl:[String]?){
        self.title    = title
        self.abstract  = abstract
        self.published_date        = published_date
        self.mediaUrl        = mediaUrl
        self.byline        = byline
    }
    
    /**
    This init receive and validate data from Json, return nil in case the struct not is available, if all data is true  call super init fof the struct
    - Parameter json : Data from Api Rest
    */
    init?(json: JsonDictionay) {
        guard let title     = json["title"] as? String else { return nil }
        guard let abstract   = json["abstract"] as? String else { return nil }
        guard let byline   = json["byline"] as? String else { return nil }
        guard let published_date = json["published_date"] as? String else { return nil }
        guard let media = json["media"] as? Array<JsonDictionay> else { return nil }
        guard let metadata = media[0]["media-metadata"] as? Array<JsonDictionay> else { return nil }
        var mediaArray:[String]? = [String]()
        for item in metadata {
            guard let imageUrl = item["url"] as? String else {
                continue
            }
            mediaArray?.append(imageUrl)
        }
        if(mediaArray?.count==0){
            mediaArray = nil
        }
        
        self.init(title: title,abstract: abstract,published_date: published_date,byline: byline,mediaUrl: mediaArray ?? nil)
    }
}

struct MostPopularDataModel {
   ///Status of API Call
    let status    : String
    ///Copyright of API Call
    let copyright  : String
    ////number of resuts of API Call
    var num_results : Int
    ///results of API Call
    var results       : [NewsDataModel]?
   
    ///Intialize funtion of datamodel
    init(status:String,copyright:String,num_results:Int,results:[NewsDataModel]){
        self.status    = status
        self.copyright  = copyright
        self.num_results        = num_results
        self.results = results
    }

   /**
   This init receive and validate data from Json, return nil in case the struct not is available, if all data is true  call super init fof the struct
   - Parameter json : Data from Api Rest
   */
    init?(json: JsonDictionay) {
        guard let status     = json["status"] as? String else { return nil }
        guard let copyright   = json["copyright"] as? String else { return nil }
        guard let num_results   = json["num_results"] as? Int else { return nil }
        guard let results         = NewsDataModel.createRequiredInstances(from: json, key: "results") else { return nil }
        self.init(status: status,copyright: copyright,num_results: num_results,results: results)
    }
}


