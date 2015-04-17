//

//  ViewController.swift

//  THPOC_membership

//

//  Created by Dev on 2/27/15.

//  Copyright (c) 2015 Inflexxion. All rights reserved.

//



import UIKit



class ViewController: UIViewController, NSURLConnectionDataDelegate {
    
    
    @IBOutlet weak var userNameFT: UITextField!
    
    @IBOutlet weak var pinFT: UITextField!
    
    @IBOutlet weak var feedbackLb: UILabel!
    var theConnnection: NSURLConnection?
    
    var webServiceData:NSMutableData?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        feedbackLb.font = UIFont(name: "Helvetica", size: 12.5)
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
        
    }
   
    
    @IBAction func Login(sender: AnyObject) {
        
        self.view.endEditing(true)
        let userEmail = userNameFT.text
        
        let userPassword = pinFT.text
        let parametersString = "email=\(userEmail)&password=\(userPassword)"
        var url:String = "http://10.200.20.86/api/mobileservice/Login?\(parametersString)"
        
        let theURL = NSURL(string: url)!
        var req:NSURLRequest = NSURLRequest(URL: theURL)
        
        theConnnection = NSURLConnection(request: req, delegate: self, startImmediately: true)
        
        /*var bm = BusinessManager()
        
        var c = LoginCredential(loginUserName: userNameFT.text, loginPin: pinFT.text)
        
        var a = bm.Login(c)
        
        userNameFT.text = ""
        
        pinFT.text = ""
        
        if !a {
        
        //userNameFT
        
        feedbackLb.text = "Wrong credential, try again"
        
        return
        
        } else {
        
        feedbackLb.text = ""
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ContentSearch") as? UIViewController
        
        self.presentViewController(vc!, animated: true, completion: nil)
        }*/
        
    }
    
    func connection(connection: NSURLConnection, didReceiveResponse response: NSURLResponse)
    {
        webServiceData = NSMutableData()
        
    }
    func connection(connection: NSURLConnection, didReceiveData data: NSData)
    {
        webServiceData?.appendData(data)
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection) {
        
        let JsonStr = NSString(data: webServiceData!, encoding: NSUTF8StringEncoding)
        
        println("json = \(JsonStr)")
        
        var jsonDict =  NSJSONSerialization.JSONObjectWithData(webServiceData!, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
        
        println("jsonDict = \(jsonDict)")
        
        var status = jsonDict["Status"] as NSInteger!
        
        if(status == 1)
            
        {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ContentSearch") as? UIViewController
            
            self.presentViewController(vc!, animated: true, completion: nil)
        }
        else
        {
            feedbackLb.text = jsonDict["Message"] as String!
            
        }
        
    }
    func connection(connection: NSURLConnection, didFailWithError error: NSError) {
        
        println("connection failed \(error.description))")
        
    }
    
    @IBAction func  dismissKB(sender:AnyObject)
    {
        self.view.endEditing(true)
    }
}

