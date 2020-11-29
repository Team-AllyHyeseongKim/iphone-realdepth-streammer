//
//  undistorter.m
//  TrueDepthStreamer
//
//  Created by Heebin Yoo on 2020/11/14.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "undistorter.h"

@implementation Undistorter

- (CGPoint)lensDistortionPointForPoint:(CGPoint)point
                           lookupTable:(NSData *)lookupTable
               distortionOpticalCenter:(CGPoint)opticalCenter
                             imageSize:(CGSize)imageSize
{
    // The lookup table holds the relative radial magnification for n linearly spaced radii.
    // The first position corresponds to radius = 0
    // The last position corresponds to the largest radius found in the image.
 
    // Determine the maximum radius.
    float delta_ocx_max = MAX( opticalCenter.x, imageSize.width  - opticalCenter.x );
    float delta_ocy_max = MAX( opticalCenter.y, imageSize.height - opticalCenter.y );
    float r_max = sqrtf( delta_ocx_max * delta_ocx_max + delta_ocy_max * delta_ocy_max );
 
    // Determine the vector from the optical center to the given point.
    float v_point_x = point.x - opticalCenter.x;
    float v_point_y = point.y - opticalCenter.y;
 
    // Determine the radius of the given point.
    float r_point = sqrtf( v_point_x * v_point_x + v_point_y * v_point_y );
 
    // Look up the relative radial magnification to apply in the provided lookup table
    float magnification;
    const float *lookupTableValues = lookupTable.bytes;
    NSUInteger lookupTableCount = lookupTable.length / sizeof(float);
 
    if ( r_point < r_max ) {
        // Linear interpolation
        float val   = r_point * ( lookupTableCount - 1 ) / r_max;
        int   idx   = (int)val;
        float frac  = val - idx;
 
        float mag_1 = lookupTableValues[idx];
        float mag_2 = lookupTableValues[idx + 1];
 
        magnification = ( 1.0f - frac ) * mag_1 + frac * mag_2;
    }
    else {
        magnification = lookupTableValues[lookupTableCount - 1];
    }
 
    // Apply radial magnification
    float new_v_point_x = v_point_x + magnification * v_point_x;
    float new_v_point_y = v_point_y + magnification * v_point_y;
 
    // Construct output
    return CGPointMake( opticalCenter.x + new_v_point_x, opticalCenter.y + new_v_point_y );
}

@end
