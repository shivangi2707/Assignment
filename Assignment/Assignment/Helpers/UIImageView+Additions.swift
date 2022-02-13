//
//  UIImageView+Additions.swift
//  Assignment
//
//  Created by Shivangi on 13/02/22.
//

import Foundation
import UIKit

extension UIImageView {
    
    // Load data from URL, and displays the same
    func setImageFromURL(urlString: String?) {
        if let urlString = urlString {
            DispatchQueue.global(qos: .background).async {
                Helper.getData(from: urlString) { data in
                    if let data = data {
                        DispatchQueue.main.async {
                            self.image = UIImage(data: data)
                        }
                    }
                }
            }
        }
    }
}
