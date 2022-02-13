//
//  DateConversions.swift
//  Assignment
//
//  Created by Shivangi on 13/02/22.
//

import Foundation

extension String {
    
    // For changing date format of the string date provided
    func convertStringDateFormat(formatFrom: String, formatTo: String)-> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = formatFrom
        if let date = formatter.date(from: self) {
            formatter.dateFormat = formatTo
            return formatter.string(from: date)
        }
        return nil
    }
}

// Date Formats
struct DateFormat {
    static let yyyyMdHHms = "YYYY-MM-dd HH:mm:ss"
    static let mmmdyyyy = "MMM d, YYYY"
}
