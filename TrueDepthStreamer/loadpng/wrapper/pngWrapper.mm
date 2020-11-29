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
    
    unsigned char* output;
    size_t outputSize;
    
    unsigned ret = lodepng_encode_memory(&output, &outputSize, (unsigned char*) orgData, (unsigned int) w, (unsigned int) h, LCT_GREY, 16);
    
    if (ret==0){
        NSData *c1 = [NSData dataWithBytes:output length:outputSize];
        return c1;
    }
    else{
        return NULL;
    }
    
    
    
}

- (NSData*) UInt32Array2PngData : (UInt32[_Nonnull]) orgData
                          width : (NSInteger) w
                         height : (NSInteger) h{
    
    unsigned char* output;
    size_t outputSize;
    
    unsigned ret = lodepng_encode_memory(&output, &outputSize, (unsigned char*) orgData, (unsigned int) w, (unsigned int) h, LCT_RGBA, 8);
    
    if (ret==0){
        NSData *c1 = [NSData dataWithBytes:output length:outputSize];
        return c1;
    }
    else{
        return NULL;
    }
    
    
    return NULL;
}

@end
