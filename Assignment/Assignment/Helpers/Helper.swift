//
//  Helper.swift
//  Assignment
//
//  Created by Shivangi on 13/02/22.
//

import Foundation

class Helper {
    
    // Fetches data from URL
    class func getData(from urlString: String, completion: @escaping (Data?)-> Void) {
        // Replacing occurences, as removingPercentEncoding was not working for the same
        let urlStr = urlString.replacingOccurrences(of: "amp;", with: "")
        guard let url = URL(string: urlStr) else {
            completion(nil)
            return
        }
        
        // Fetches data
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error == nil, let data = data {
                completion(data)
                return
            }
            completion(nil)
        }.resume()
    }
}
