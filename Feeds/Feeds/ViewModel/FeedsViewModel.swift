//
//  FeedsViewModel.swift
//  Feeds
//
//  Created by Nishita Shukla on 26/08/20.
//  Copyright © 2020 Nishita Shukla. All rights reserved.
//

import Foundation
class FeedsViewModel
{
    var feedsClient : FeedsClientProtocol
    
    //MARK: Initialize Feeds Client
    init(_feedsClient: FeedsClientProtocol = FeedsClient(_httpClient: HTTPClient()))
    {
        self.feedsClient = _feedsClient
    }
    
    //MARK: Get Feeds List ---> GET Method
    func getFeedsListData(completionHandler:@escaping (Result<FeedsModel, APIError>) -> ())
    {
        feedsClient.getFeedsList(url: URLConstants.BASEURL, data: [:]) { (result) in
            switch result
            {
            case .success(let feeds):
                self.processFetchedFeeds(feeds: feeds.body?.data)
                completionHandler(.success(feeds))
                
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    //MARK: Process Data
    func processFetchedFeeds(feeds:[Datum]?)
    {
        guard let feeds = feeds else
        {
            return
        }
        
        for feed in feeds {
            print(feed.feed?.feedTitle)
        }
    }
}
