//
//  RSSItem.swift
//  SwiftRSS_Example
//
//  Created by Thibaut LE LEVIER on 28/09/2014.
//  Copyright (c) 2014 Thibaut LE LEVIER. All rights reserved.
//

import UIKit

class RSSItem: NSObject, NSCoding {
    var title: String?
    var link: URL?
    
    func setLink(linkString: String)
    {
        link = URL(string: linkString)
    }
    
    var guid: String?
    var pubDate: Date?
    
    func setPubDate(dateString: String)
    {
        pubDate = Date.dateFromInternetDateTimeString(dateString)
    }
    
    var itemDescription: String?
    var content: String?
    
    // Wordpress specifics
    var commentsLink: URL?
    
    func setCommentsLink(linkString: String)
    {
        commentsLink = URL(string: linkString)
    }
    
    var commentsCount: Int?
    
    var commentRSSLink: URL?
    
    func setCommentRSSLink(linkString: String)
    {
        commentRSSLink = URL(string: linkString)
    }
    
    var author: String?
    
    var categories: [String]! = [String]()
    
    var imagesFromItemDescription: [URL]! {
        if let itemDescription = self.itemDescription
        {
            return itemDescription.imageLinksFromHTMLString as [URL]!
        }
        
        return [URL]()
    }
    
    var imagesFromContent: [URL]! {
        if let content = self.content
        {
            return content.imageLinksFromHTMLString as [URL]!
        }
        
        return [URL]()
    }
    
    override init()
    {
        super.init()
    }
    
    // MARK: NSCoding
    required init(coder aDecoder: NSCoder)
    {
        super.init()
        
        title = aDecoder.decodeObject(forKey: "title") as? String
        link = aDecoder.decodeObject(forKey: "link") as? URL
        guid = aDecoder.decodeObject(forKey: "guid") as? String
        pubDate = aDecoder.decodeObject(forKey: "pubDate") as? Date
        itemDescription = aDecoder.decodeObject(forKey: "description") as? NSString as String?
        content = aDecoder.decodeObject(forKey: "content") as? NSString as String?
        commentsLink = aDecoder.decodeObject(forKey: "commentsLink") as? URL
        commentsCount = aDecoder.decodeInteger(forKey: "commentsCount")
        commentRSSLink = aDecoder.decodeObject(forKey: "commentRSSLink") as? URL
        author = aDecoder.decodeObject(forKey: "author") as? String
        categories = aDecoder.decodeObject(forKey: "categories") as? [String]
    }
    
    func encode(with aCoder: NSCoder)
    {
        if let title = self.title
        {
            aCoder.encode(title, forKey: "title")
        }
        
        if let link = self.link
        {
            aCoder.encode(link, forKey: "link")
        }
        
        if let guid = self.guid
        {
            aCoder.encode(guid, forKey: "guid")
        }
        
        if let pubDate = self.pubDate
        {
            aCoder.encode(pubDate, forKey: "pubDate")
        }
        
        if let itemDescription = self.itemDescription
        {
            aCoder.encode(itemDescription, forKey: "description")
        }
        
        if let content = self.content
        {
            aCoder.encode(content, forKey: "content")
        }
        
        if let commentsLink = self.commentsLink
        {
            aCoder.encode(commentsLink, forKey: "commentsLink")
        }
        
        if let commentsCount = self.commentsCount
        {
            aCoder.encode(commentsCount, forKey: "commentsCount")
        }
        
        if let commentRSSLink = self.commentRSSLink
        {
            aCoder.encode(commentRSSLink, forKey: "commentRSSLink")
        }
        
        if let author = self.author
        {
            aCoder.encode(author, forKey: "author")
        }
        
        aCoder.encode(categories, forKey: "categories")
    }
}
