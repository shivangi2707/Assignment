//
//  NewsFeedViewModel.swift
//  Assignment
//
//  Created by Shivangi on 12/02/22.
//

import Foundation

class NewsFeedViewModel {
    
    var apiService: APIService = APIService()
    var newsFeed: [NewsFeedItem]?
    
    // ABC RSS News Feed
    func fetchRssFeed(completion: @escaping ([NewsFeedItem]?)-> Void) {
        // Background request
        DispatchQueue.global(qos: .background).async {
            self.apiService.fetchRssFeed { (newsFeed) in
                if let newsFeed = newsFeed {
                    self.newsFeed = newsFeed
                    completion(newsFeed)
                    return
                }
                completion(nil)
            }
        }
    }
}
