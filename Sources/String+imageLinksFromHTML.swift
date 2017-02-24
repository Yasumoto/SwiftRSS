//
//  String+ImageLinksFromHTML.swift
//  SwiftRSS_Example
//
//  Created by Thibaut LE LEVIER on 22/10/2014.
//  Copyright (c) 2014 Thibaut LE LEVIER. All rights reserved.
//

import Foundation

extension String {
    var imageLinksFromHTMLString: [URL]
    {
        var matches = [URL]()
        let foundationString = self as NSString
        let fullRange: NSRange = NSMakeRange(0, foundationString.length)
        do {
            let regex = try NSRegularExpression(pattern:"(https?)\\S*(png|jpg|jpeg|gif)", options:.caseInsensitive)
            regex.enumerateMatches(in: self, options: [NSRegularExpression.MatchingOptions.reportCompletion], range: fullRange) {
                (result : NSTextCheckingResult?, _, _) in
                
                // didn't find a way to bridge an NSRange to Range<String.Index>
                // bridging String to NSString instead
                if let match = result {
                    let str = foundationString.substring(with: match.range) as String
                
                    if let url = URL(string: str) {
                        matches.append(url)
                    }
                }
            }
        } catch {
            NSLog("Error while searching for images: \(error)")
        }
        
        return matches
    }
}
