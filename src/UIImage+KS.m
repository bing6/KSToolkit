//
//  UIImage+KS.m
//  KSToolkit
//
//  Created by bing.hao on 14/11/30.
//  Copyright (c) 2014年 bing.hao. All rights reserved.
//

#import "UIImage+KS.h"

@implementation UIImage (KS)

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

- (UIImage *)imageZoomWithSize:(CGSize)toSize
{
    if (CGSizeEqualToSize(toSize, self.size)) {
        return self;
    }
    
    CGSize oldSize = self.size;
    CGSize newSize = CGSizeMake(toSize.width, toSize.width / oldSize.width * oldSize.height);
    if (newSize.height < toSize.height) {
        newSize.height = toSize.height;
        newSize.width  = toSize.height / oldSize.height * oldSize.width;
    }
    
    UIGraphicsBeginImageContext(newSize);
    [self drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (UIImage *)imageZoomWithSize:(CGSize)size compression:(CGFloat)compression
{
    UIImage * image = [self imageZoomWithSize:size];
    NSData  * data  = UIImageJPEGRepresentation(image, compression);
    
    return [UIImage imageWithData:data];
}

- (UIImage *)gaussianBlur
{
    CIImage *ciImage = [[CIImage alloc] initWithImage:self];
    
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"
                                  keysAndValues:kCIInputImageKey, ciImage, nil];
    [filter setDefaults];
    [filter setValue:[NSNumber numberWithFloat:10.0f] forKey:@"inputRadius"];
    
    CIContext *context     = [CIContext contextWithOptions:nil];
    CIImage   *outputImage = [filter outputImage];
    CGImageRef cgImage     = [context createCGImage:outputImage
                                       fromRect:[ciImage extent]];
    
    UIImage *image = [UIImage imageWithCGImage:cgImage];
    
    CGImageRelease(cgImage);
    
    return image;
}

@end
