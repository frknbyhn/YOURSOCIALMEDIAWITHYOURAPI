//
//  ApiManager.swift
//  NotificiationList
//
//  Created by Furkan Beyhan on 2.03.2019.
//  Copyright © 2019 Furkan Beyhan. All rights reserved.
//

import Foundation
import Alamofire

final class ApiManager {
    

    static let shared = ApiManager()
    
    private let parameters : Parameters = [
        "//PARAMETERS_HERE" : "VALUE_HERE"
    ]
    
    private let parametersHomeFeed : Parameters = [
        "//PARAMETERS_HERE" : "VALUE_HERE"
    ]
    
    private let parametersEventDetail : Parameters = [
        "//PARAMETERS_ERE" : "VALUE_HERE"
    ]
    
    
    struct Api {
        
        static let baseUrl = "BASE_URL_HERE"
        
    }
    
    private let header : HTTPHeaders = ["Authorization" : "API_KEY_HERE" , "Content-Type" : "CONTENT_TYPE_HERE"]
    
    
    func call <T:Decodable> (class model: T.Type, success : @escaping (T) -> Void, error : @escaping (Error) -> Void)  {
        
        Alamofire.request(Api.baseUrl+"/account/UserNotifications", method: .post, parameters: parameters, encoding: URLEncoding.default, headers: header).response { (response) in
            
            guard let data = response.data else { fatalError("Data value is nil") }
            
            do{
                let decodingObject = try JSONDecoder().decode(model.self, from: data)
                success(decodingObject)
            }catch let err {
                error(err)
            }
        }
    }
    
    func callHomeFeed <T:Decodable> (class model: T.Type, success : @escaping (T) -> Void, error : @escaping (Error) -> Void)  {
        
        Alamofire.request(Api.baseUrl+"/Event/HomeFeed", method: .post, parameters: parametersHomeFeed, encoding: URLEncoding.default, headers: header).response { (response) in
            
            guard let data = response.data else { fatalError("Data value is nil") }
            
            do{
                let decodingObject = try JSONDecoder().decode(model.self, from: data)
                success(decodingObject)
            }catch let err {
                error(err)
            }
            
        }
        
    }
    
    func callEventDetail <T:Decodable> (class model: T.Type, success : @escaping (T) -> Void, error : @escaping (Error) -> Void)  {
        
        Alamofire.request(Api.baseUrl+"/Event/Detail", method: .post, parameters: parametersEventDetail, encoding: URLEncoding.default, headers: header).response { (response) in

            guard let data = response.data else { fatalError("Data value is nil") }

            do{
                let decodingObject = try JSONDecoder().decode(model.self, from: data)
                success(decodingObject)
            }catch let err{
                error(err)
            }
        }
    }
}

