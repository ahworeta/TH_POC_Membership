//
//  ContentViewController.swift
//  THPOC_membership
//
//  Created by Dev on 4/2/15.
//  Copyright (c) 2015 Inflexxion. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController, NSURLConnectionDataDelegate {
    

    @IBOutlet weak var ContentIDTF: UITextField!
    @IBOutlet weak var ContentTitleTF: UITextView!
    @IBOutlet weak var ContentValueTF: UITextView!
    
    var theConnnection: NSURLConnection?
    var webServiceData:NSMutableData?
    
    @IBAction func Search(sender: AnyObject) {
        
        self.view.endEditing(true)
        
        
        var url:String = "http://10.200.20.86/api/mobileservice/\(ContentIDTF.text)"
        //url  = "https://itunes.apple.com/search?term=bob&media=music"
        
        let theURL = NSURL(string: url)!
        
        var req:NSURLRequest = NSURLRequest(URL: theURL)
        
        theConnnection = NSURLConnection(request: req, delegate: self, startImmediately: true)
        
    }
    
    
    func connection(connection: NSURLConnection, didReceiveResponse response: NSURLResponse) {
        webServiceData = NSMutableData()
    }
    
    
    func connection(connection: NSURLConnection, didReceiveData data: NSData) {
        webServiceData?.appendData(data)
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection) {
        let JsonStr = NSString(data: webServiceData!, encoding: NSUTF8StringEncoding)
        println("json = \(JsonStr)")
        
        var jsonDict =  NSJSONSerialization.JSONObjectWithData(webServiceData!, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
        
        println("jsonDict = \(jsonDict)")
        ContentTitleTF.text = jsonDict.valueForKey("ContentName") as NSString
        
        ContentValueTF.text = jsonDict.valueForKey("ContentValue") as NSString
        
    }
    
    func connection(connection: NSURLConnection, didFailWithError error: NSError) {
        println("connection failed \(error.description))")
    }
    
    
}
