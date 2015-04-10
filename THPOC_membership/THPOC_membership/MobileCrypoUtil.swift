//
//  MobileCrypoUtil.swift
//  THPOC_membership
//
//  Created by Allen Xu on 4/10/15.
//  Copyright (c) 2015 Inflexxion. All rights reserved.
//

import Foundation


class MobileCrypoUtil{
    
    func generateSecurityToken() ->NSString {
        
        return getEncryptedData("abebe")
        
    }
    
    func isValidSecurityToken(token: NSString) -> Bool {
        return false
    }
    
   

    func getEncryptedData(plainText: NSString)->String
    {
       
       var instanceOfStringEncryption:StringEncryption = StringEncryption()
        
        let secretKey:NSString = "my secret key"
        
        
        
        var key = instanceOfStringEncryption.sha256(secretKey, length: 31)
        
        println("Key: \(key)")
        
        //let iv:NSData = instanceOfStringEncryption.generateRandomIV(11)
        
        let iv:NSData = ("allen" as NSString).dataUsingEncoding(NSUTF8StringEncoding)!
        
        println("iv: \(iv)")
        
        // key = [[StringEncryption alloc] sha256:key length:32]; //this is very important, 32 bytes = 256 bit
        
        // NSString * iv =   [[[[StringEncryption alloc] generateRandomIV:11]  base64EncodingWithLineLength:0] substringToIndex:16]; //Here we are generating random initialization vector (iv). Length of this vector = 16 bytes = 128 bits
        
        //let base64Decoded = NSString(data: iv, encoding: NSUTF8StringEncoding)
        
        let base64Decoded = NSString(data: iv, encoding: UInt())
        
        println("string iv \(base64Decoded)")
        
        //let base64Decoded:NSString = NSString(data: iv, encoding: NSUTF8StringEncoding)!
        
        let plainData = (plainText as NSString).dataUsingEncoding(NSUTF8StringEncoding)
        
        println("plain data: \(plainData)")
        
        var encryptedData:NSData = instanceOfStringEncryption.encrypt(plainData, key: key, iv: base64Decoded)
        let base64String = encryptedData.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.allZeros)
        
        //let encryptedDataString = NSString(data: encryptedString, encoding: UInt())
        
        println("Encrypted string: \(base64String)")
        
        var decryptedData:NSData = instanceOfStringEncryption.decrypt(encryptedData, key: key, iv: base64Decoded)
        
        let decryptedDataString = NSString(data: decryptedData, encoding: UInt())
        
        println("Decrypted: \(decryptedDataString)")
        
        return base64String
    }

   
}
    
