//
//  DetailViewController.swift
//  SwiftRSS_Example
//
//  Created by Thibaut LE LEVIER on 05/09/2014.
//  Copyright (c) 2014 Thibaut LE LEVIER. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var itemWebView: UIWebView!
    
    
    var detailItem: RSSItem? {
        didSet {
            self.configureView()
        }
    }
    
    func configureView() {
        
        if let item: RSSItem = self.detailItem
        {
            if let webView = self.itemWebView
            {
                var template : String
                let templateURL = URL(fileURLWithPath: Bundle.main.path(forResource: "template", ofType: "html")!)
                do {
                    template = try NSString(contentsOf: templateURL, encoding: String.Encoding.utf8.rawValue) as String
                } catch {
                    NSLog("Error parsing template \(error)")
                    return
                }
                if let title = item.title
                {
                    template = template.replacingOccurrences(of: "###TITLE###", with: title)
                }
                
                if let content = item.content
                {
                    template = template.replacingOccurrences(of: "###CONTENT###", with: content)
                }
                else if let description = item.itemDescription
                {
                    template = template.replacingOccurrences(of: "###CONTENT###", with: description)
                }
                
                if let date = item.pubDate
                {
                    let formatter = DateFormatter()
                    formatter.dateFormat = "MMM dd, yyyy"
                    
                    template = template.replacingOccurrences(of: "###DATE###", with: formatter.string(from: date))
                }
                
                webView.loadHTMLString(template, baseURL: nil)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
