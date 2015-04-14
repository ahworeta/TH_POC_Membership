//
//  RegisterViewController.swift
//  THPOC_membership
//
//  Created by Matt Solano on 4/7/15.
//  Copyright (c) 2015 Inflexxion. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, NSURLConnectionDataDelegate {

    @IBOutlet weak var emaiTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    var theConnnection: NSURLConnection?
    var webServiceData:NSMutableData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func signUp(sender: UIButton) {
        //let email = emaiTF.text.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
        let token = MobileCrypoUtil().generateSecurityToken()
        let actor = MobileActor(deviceId: UIDevice.currentDevice().identifierForVendor.UUIDString, membershipId: "", securityToken: token, domainId: "tobeadded")  //TODO: get domainid from settings
        
        let regReq = RegistrationRequest(actor: actor, email: emaiTF.text, password: passwordTF.text)
        
        
        
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
        
        //var jsonDict =  NSJSONSerialization.JSONObjectWithData(webServiceData!, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
        
        //println("jsonDict = \(jsonDict)")
        
        
    }
    
    func connection(connection: NSURLConnection, didFailWithError error: NSError) {
        println("connection failed \(error.description))")
    }
    
}
