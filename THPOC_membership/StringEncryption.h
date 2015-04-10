//
//  StringEncryption.h
//  THPOC_membership
//
//  Created by Allen Xu on 4/10/15.
//  Copyright (c) 2015 Inflexxion. All rights reserved.
//

#ifndef THPOC_membership_StringEncryption_h
#define THPOC_membership_StringEncryption_h
#endif

#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>
#import <Foundation/Foundation.h>



@interface StringEncryption : NSObject

-  (NSData *)encrypt:(NSData *)plainText key:(NSString *)key iv:(NSString *)iv;
-  (NSData *)decrypt:(NSData *)encryptedText key:(NSString *)key iv:(NSString *)iv;
-  (NSData *)generateRandomIV:(size_t)length;
-  (NSString *) md5:(NSString *) input;
-  (NSString*) sha256:(NSString *)key length:(NSInteger) length;

@end


