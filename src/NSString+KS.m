//
//  NSString+KS.m
//  KSToolkit
//
//  Created by bing.hao on 14/12/5.
//  Copyright (c) 2014年 bing.hao. All rights reserved.
//

#import "NSString+KS.h"
#import "Base64.h"
#import <CommonCrypto/CommonCrypto.h>


@implementation NSString (KS)

+ (BOOL)isNullOrEmpty:(NSString *)str
{
    if (str == nil || [str isEqual:[NSNull null]]) {
        return YES;
    }
    if (!str) {
        // null object
        return YES;
    } else {
        NSString *trimedString = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if ([trimedString length] == 0) {
            // empty string
            return YES;
        } else {
            // is neither empty nor null
            return NO;
        }
    }
}

+ (NSString *)GUID
{
    CFUUIDRef   uuid_ref        = CFUUIDCreate(NULL);
    CFStringRef uuid_string_ref = CFUUIDCreateString(NULL, uuid_ref);
    
    CFRelease(uuid_ref);
    
    NSString *uuid = [NSString stringWithString:(__bridge NSString*)uuid_string_ref];
    
    CFRelease(uuid_string_ref);
    
    return uuid;
}

#pragma mark -

+ (id)MD5EncryptionWithString:(NSString *)str
{
    if (str == nil) {
        return nil;
    }
    const char *cStr = [str UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (int)str.length, digest );
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [result appendFormat:@"%02x", digest[i]];
    
    return result;
}

- (NSString *)toMD5Encryption
{
    return [NSString MD5EncryptionWithString:self];
}

#pragma mark -

+ (id)AESEncryptionWithKey:(NSString *)key withString:(NSString *)str
{
    if ([self isNullOrEmpty:str]) {
        return nil;
    }
    
    NSData * odata = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSData * ndata = [self getAESEncryptionDataWithKey:key withData:odata];
    
    return [ndata base64EncodedString];
}

+ (id)AESDecryptionWithKey:(NSString *)key withString:(NSString *)str
{
    if ([self isNullOrEmpty:str]) {
        return nil;
    }
    
    NSData * odata = [NSData dataWithBase64EncodedString:str];
    NSData * ndata = [self getAESDecryptionDataWithKey:key withData:odata];
    
    return [[NSString alloc] initWithData:ndata encoding:NSUTF8StringEncoding];
}

+ (NSData *)getAESEncryptionDataWithKey:(NSString *)key withData:(NSData *)data
{
    char keyPtr[kCCKeySizeAES128]; // room for terminator (unused)
    bzero(keyPtr, sizeof(keyPtr)); // fill with zeroes (for padding)
    
    // fetch key data
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    NSUInteger dataLength = [data length];
    
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    size_t numBytesEncrypted = 0;
    
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                          kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding,
                                          keyPtr, kCCKeySizeAES128,
                                          keyPtr /* initialization vector (optional) */,
                                          [data bytes],
                                          [data length], /* input */
                                          buffer, bufferSize, /* output */
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        //the returned NSData takes ownership of the buffer and will free it on deallocation
        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
    }
    
    free(buffer); //free the buffer;
    return nil;
}

+ (NSData *)getAESDecryptionDataWithKey:(NSString *)key withData:(NSData *)data
{
    char keyPtr[kCCKeySizeAES128]; // room for terminator (unused)
    bzero(keyPtr, sizeof(keyPtr)); // fill with zeroes (for padding)
    
    // fetch key data
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    NSUInteger dataLength = [data length];
    
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    size_t numBytesEncrypted = 0;
    
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding,
                                          keyPtr, kCCKeySizeAES128,
                                          keyPtr /* initialization vector (optional) */,
                                          [data bytes],
                                          [data length], /* input */
                                          buffer, bufferSize, /* output */
                                          &numBytesEncrypted);
    
    if (cryptStatus == kCCSuccess) {
        //the returned NSData takes ownership of the buffer and will free it on deallocation
        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
    }
    
    free(buffer); //free the buffer;
    return nil;
}

- (NSString *)toAESEncryptionWithKey:(NSString *)key
{
    return [NSString AESEncryptionWithKey:key withString:self];
}

- (NSString *)toAESDecryptionWithKey:(NSString *)key
{
    return [NSString AESDecryptionWithKey:key withString:self];
}





@end
