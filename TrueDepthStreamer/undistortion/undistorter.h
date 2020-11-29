//
//  undistorter.h
//  TrueDepthStreamer
//
//  Created by Heebin Yoo on 2020/11/14.
//  Copyright © 2020 Apple. All rights reserved.
//  from https://developer.apple.com/videos/play/wwdc2017/507/

#ifndef undistorter_h
#define undistorter_h

#import <AVFoundation/AVBase.h>
#import <Foundation/Foundation.h>
#import <simd/matrix_types.h>
#import <CoreGraphics/CGGeometry.h>

NS_ASSUME_NONNULL_BEGIN

@interface Undistorter : NSObject


- (CGPoint)lensDistortionPointForPoint:(CGPoint)point
                           lookupTable:(NSData *)lookupTable
               distortionOpticalCenter:(CGPoint)opticalCenter
                             imageSize:(CGSize)imageSize;

@end

NS_ASSUME_NONNULL_END

#endif /* undistorter_h */
