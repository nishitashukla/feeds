//
//  FeedsClient.swift
//  Feeds
//
//  Created by Nishita Shukla on 26/08/20.
//  Copyright © 2020 Nishita Shukla. All rights reserved.
//

import Foundation

struct FeedsClient
{
    
    //Dependecy Injection
    var httpClient : HTTPClient
    
    init(_httpClient: HTTPClient)
    {
        httpClient = _httpClient
    }
    
}

extension FeedsClient : FeedsClientProtocol
{
    
    //MARK: Get Products List
    func getFeedsList(url:String , data:[String:String], completionHandler:@escaping (Result<FeedsModel, APIError>) -> ())
    {
        httpClient.callWebService(requestUrl: url, dataToSend: data, requestType: APIRequestType.APIRequestTypeGet, resultType: FeedsModel.self) { result in
            
            switch result
            {
            case .success(let product):
                completionHandler(.success(product))
                
            case .failure(let error):
                completionHandler(.failure(error))
            }
            
        }
    }
}
