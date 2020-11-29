//
//  pngWrapper.m
//  TrueDepthStreamer
//
//  Created by Heebin Yoo on 2020/11/15.
//  Copyright © 2020 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "pngWrapper.h"
#include "../lodepng.h"

/*
 unsigned lodepng_encode_memory(unsigned char** out, size_t* outsize,
                                const unsigned char* image, unsigned w, unsigned h,
                                LodePNGColorType colortype, unsigned bitdepth);
 */
@implementation PngWrapper
- (NSData*) UInt16Array2PngData : (UInt16[_Nonnull]) orgData
                          width : (NSInteger) w
                         height : (NSInteger) h{
    lodepng_encode_memory()
    
    return NULL;
}

- (NSData*) UInt32Array2PngData : (UInt32[_Nonnull]) orgData
                          width : (NSInteger) w
                         height : (NSInteger) h{
    
    
    return NULL;
}

@end
