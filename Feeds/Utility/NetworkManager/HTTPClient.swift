//
//  HTTPClient.swift
//  Feeds
//
//  Created by Nishita Shukla on 25/08/20.
//  Copyright © 2020 Nishita Shukla. All rights reserved.
//

import Foundation

enum APIRequestType : String
{
    case APIRequestTypeGet  = "GET"
}

func callWebService<T:Decodable>(requestUrl:String?, dataToSend:Any? , requestType: APIRequestType, resultType: T.Type, completionHandler:@escaping (Result<T, APIError>) -> ())
{
    
    guard var urlString = requestUrl , urlString != "" else
    {
        completionHandler(.failure(.invalidURL))
        return
    }
    
    //Create Request
    var urlRequest = URLRequest(url: URL(string: urlString)!)
    urlRequest.httpMethod = requestType.rawValue
    
    /*
     ================= GET METHOD ================
     1. Check if dataToSend is of type [String : String]
     2. If yes then convert Dictionary to key2=value2&key1=value1 so that it can passed directly in Get Method
     3. If not then use the URL to make request because get method can be used without request string.
     ================= GET METHOD ================
     */
    
    if(requestType == .APIRequestTypeGet)
    {
        if let dataToSend = dataToSend as? [String : String]
        {
            let requestString = dataToSend.map { $0.0 + "=" + $0.1 }.joined(separator: "&")
            urlString = urlString + "?" + requestString
            
            //URL is changed. Create request with updated URL
            urlRequest = URLRequest(url: URL(string: urlString)!)
            urlRequest.httpMethod = requestType.rawValue
        }
    }
    
    URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
        
        if let _ = error
        {
            completionHandler(.failure(.unableToComplete))
            return
        }
        
        guard let response = response as? HTTPURLResponse ,  response.statusCode == 200 else
        {
            completionHandler(.failure(.invalidResponse))
            return
        }
        
        guard let data = data else
        {
            completionHandler(.failure(.invalidData))
            return
        }
        
        //parse the responseData here
        let decoder = JSONDecoder()
        do {
            let result = try decoder.decode(T.self, from: data)
            completionHandler(.success(result))
        }
        catch let error{
            print(error)
            completionHandler(.failure(.invalidData))
        }
        
    }.resume()
}
