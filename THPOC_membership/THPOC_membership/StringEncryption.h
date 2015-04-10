//
//  StringEncryption.h
//  EncryNDecryptionTest
//
//  Created by Dev on 4/9/15.
//  Copyright (c) 2015 Dev. All rights reserved.
//

#ifndef EncryNDecryptionTest_StringEncryption_h
#define EncryNDecryptionTest_StringEncryption_h


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
