//
//  pngWrapper.h
//  TrueDepthStreamer
//
//  Created by Heebin Yoo on 2020/11/15.
//  Copyright © 2020 Apple. All rights reserved.
//

#ifndef pngWrapper_h
#define pngWrapper_h

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface PngWrapper : NSObject

/*
 unsigned lodepng_encode_memory(unsigned char** out, size_t* outsize,
                                const unsigned char* image, unsigned w, unsigned h,
                                LodePNGColorType colortype, unsigned bitdepth);
 */


- (NSData*) UInt16Array2PngData : (UInt16[_Nonnull]) orgData
                            width : (NSInteger) w
                           height : (NSInteger) h;

- (NSData*) UInt32Array2PngData : (UInt32[_Nonnull]) orgData
                            width : (NSInteger) w
                           height : (NSInteger) h;

@end

NS_ASSUME_NONNULL_END


#endif /* pngWrapper_h */
