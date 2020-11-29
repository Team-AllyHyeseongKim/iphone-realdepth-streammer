//
//  HttpUtility.swift
//  MvvmDemoApp
//
//  Created by Codecat15 on 3/14/2020.
//  Copyright © 2020 Codecat15. All rights reserved.
//

import Foundation

struct HttpUtility
{
    func getApiData<T:Decodable>(requestUrl: URL, resultType: T.Type, completionHandler:@escaping(_ result: T?)-> Void)
    {
        URLSession.shared.dataTask(with: requestUrl) { (responseData, httpUrlResponse, error) in
            if(error == nil && responseData != nil && responseData?.count != 0)
            {
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(T.self, from: responseData!)
                    _=completionHandler(result)
                }
                catch let error{
                    debugPrint("error occured while decoding = \(error)")
                }
            }

        }.resume()
    }

    func postApiData<T:Decodable>(requestUrl: URL, requestBody: Data, resultType: T.Type, completionHandler:@escaping(_ result: T)-> Void)
    {
        var urlRequest = URLRequest(url: requestUrl)
        urlRequest.httpMethod = "post"
        urlRequest.httpBody = requestBody
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")

        URLSession.shared.dataTask(with: urlRequest) { (data, httpUrlResponse, error) in
            if(error == nil && data != nil && data?.count != 0)
            {
                do {
                    let response = try JSONDecoder().decode(T.self, from: data!)
                    _=completionHandler(response)
                }
                catch let decodingError {
                    debugPrint(decodingError)
                }
            }

        }.resume()
    }

    // Use the Multipart API to refractor this code, you may use the image api boundary format for your reference and if you are stuck then feel free to contact, I will be happy to help you.
    
    func postApiDataWithMultipartForm<T:Decodable>(requestUrl: URL, request: ImageRequest, resultType: T.Type, completionHandler:@escaping(_ result: T)-> Void)
    {
        var urlRequest = URLRequest(url: requestUrl)

        urlRequest.httpMethod = "post"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        let now=Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMddHHmmssSSSS"
        


        
        let param = ["timestamp":dateFormatter.string(from:now),
                     "color": request.color, "depth": request.depth] // JSON 객체로 변환할 딕셔너리 준비
        let requestData = try! JSONSerialization.data(withJSONObject: param, options: [])
         
        
        urlRequest.httpBody = requestData
        
        urlRequest.setValue(String(requestData.count), forHTTPHeaderField: "Content-Length")
        
        //print("ddo")
        URLSession.shared.dataTask(with: urlRequest) { (data, httpUrlResponse, error) in
            guard let _ = data, error == nil else {                                                 // check for fundamental networking
                print("error=\(String(describing: error))")
                return
            }
            //print("good")

        }.resume()

    }
}
