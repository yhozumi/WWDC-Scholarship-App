//
//  TimelineEvent.swift
//  Yusuke Hozumi
//
//  Created by Suke Hozumi on 4/24/16.
//  Copyright © 2016 Suke Hozumi. All rights reserved.
//

import Foundation

struct TimelineEvent {
    enum JSONParseError: ErrorType {
        case InvalidTitle
        case InvalidDate
        case InvalidDescription
        case InvalidIndex
    }
    
    private(set) var title: String
    private(set) var date: String
    private(set) var description: String
    private(set) var index: Int
    
    init(json: [String: AnyObject]) throws {
        guard let title = json["title"] as? String else { throw JSONParseError.InvalidTitle }
        self.title = title
        
        guard let date = json["date"] as? String else { throw JSONParseError.InvalidDate }
        self.date = date
        
        guard let description = json["description"] as? String else { throw JSONParseError.InvalidDescription }
        self.description = description
        
        guard let index = json["index"] as? Int else { throw JSONParseError.InvalidIndex }
        self.index = index
    }
}