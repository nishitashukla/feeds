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
    
    
    //Save list of feeds to update in table view
    private var cellViewModels: [FeedsListCellModel] = [FeedsListCellModel]()

    var numberOfCells: Int
    {
        return cellViewModels.count             // Number of cells for tableview
    }
    
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
        var arrCellModels = [FeedsListCellModel]() //Temp Array
        for feed in feeds {
            arrCellModels.append(createCellViewModel(feed: feed))
        }
        
        self.cellViewModels = arrCellModels
    }
    
    func getCellViewModel( at indexPath: IndexPath ) -> FeedsListCellModel
    {
        return cellViewModels[indexPath.row]
    }
    
    private func createCellViewModel( feed: Datum ) -> FeedsListCellModel
    {
        var attachmentURL = ""
        var attachmentTitle = ""
        var attachmentBody = ""
        
        if let attachments = feed.feed?.attachment
        {
            for attachment in attachments {
                attachmentURL = attachment.imageMain?.src ?? ""
                attachmentTitle = attachment.title ?? ""
                attachmentBody = attachment.body ?? ""
            }
        }
    
        return FeedsListCellModel(
            title: feed.feed?.feedTitle ?? "NA",
            body:feed.feed?.body ?? "",
            feedType:feed.feed?.type ?? "",
            owner_image: feed.feed?.object?.imageNormal ?? "",
            owner_title: feed.feed?.object?.ownerTitle ?? "",
            created_date: feed.feed?.object?.creationDate ?? "",
            likes_count: feed.feed?.object?.likeCount ?? 0,
            comment_count: feed.feed?.object?.commentCount ?? 0,
            attachment_image: attachmentURL,
            attachment_title: attachmentTitle,
            attachment_body: attachmentBody
        )
    }
}
