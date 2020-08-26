//
//  FeedsClientProtocol.swift
//  Feeds
//
//  Created by Nishita Shukla on 26/08/20.
//  Copyright © 2020 Nishita Shukla. All rights reserved.
//

import Foundation

protocol FeedsClientProtocol
{
     func getFeedsList(url:String , data:[String:String], completionHandler:@escaping (Result<FeedsModel, APIError>) -> ())
}
