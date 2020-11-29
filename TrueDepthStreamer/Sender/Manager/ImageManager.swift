//
//  ImageManager.swift
//  UploadImageSample
//
//  Created by CodeCat15 on 4/10/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import Foundation
import AVFoundation
import CoreVideo

import MobileCoreServices
import Accelerate
import ARKit

// Hey there, I hope the video helped you, and if it did do like the video and share it with your iOS group. Do let me know if you have any questions on this topic and I will be happy to help you out :) ~ Ravi

struct ImageManager
{
    let httpUtility = HttpUtility()

    func uploadImage(color_data: Data, depth_data: Data) //color_ciImage: CIImage, depth_data: Data)
    {
        /*
        //let color_ciImage = CIImage(cvPixelBuffer: colorPixelBuffer)
        //let depth_ciImage = CIImage(cvPixelBuffer: depthPixelBuffer!)
        
        
        
        let size = CGSize(width:  640  , height: 480 )
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        let color_uiImage = UIImage(ciImage: color_ciImage)
        //let depth_uiImage = UIImage(ciImage: depth_data)
        
        var new_color_uiImage : UIImage!
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        color_uiImage.draw(in: rect)
        new_color_uiImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()



        let color_jpg = new_color_uiImage.jpegData(compressionQuality: 0.90)
       
        
        
        
        //let heightInPoints = color_uiImage.size.height

        //let widthInPoints = color_uiImage.size.width
        //let widthScale = color_uiImage.scale
         */
        
        
        let imageUploadRequest = ImageRequest(color: color_data.base64EncodedString(), depth: (depth_data.base64EncodedString()))

        
        httpUtility.postApiDataWithMultipartForm(requestUrl: URL(string: Endpoints.uploadImageMultiPartForm)!, request: imageUploadRequest, resultType: ImageResponse.self) {
            (response) in
        }



    }
}
