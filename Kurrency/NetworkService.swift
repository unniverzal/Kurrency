//
//  NetworkService.swift
//  Kurrency
//
//  Created by Ard Stavileci on 7/16/17.
//  Copyright © 2017 Ard Stavileci. All rights reserved.
//

import Foundation
import AlamofireObjectMapper
import Alamofire
import ObjectMapper

class NetworkService {
	
	static let shared = NetworkService()
	
	private init() {
		
	}

	func executeRequest<T:Mappable>(method: HTTPMethod , url : URLConvertible , parameters : [String : Any]? = nil, headers : [String : String]? = nil, onSucceed : @escaping (T)->Void, onFailure:@escaping (Error)->Void){
		
		Alamofire.request(url, method: method, parameters: parameters, encoding: URLEncoding.default, headers: headers).validate().responseObject { (response:DataResponse<T>) in
			if let error = response.result.error{
				onFailure(error)
			}else if let responseObject = response.result.value{
				onSucceed(responseObject)
			}
		}
	}
	
	func executeRequest(method: HTTPMethod , url : URLConvertible , parameters : [String : Any]? = nil, headers : [String : String]? = nil, onSucceed : @escaping ([String:Any])->Void, onFailure:@escaping (Error)->Void){
		
		Alamofire.request(url, method: method, parameters: parameters, encoding: URLEncoding.default, headers: headers).validate().responseJSON { response in
			if let error = response.result.error{
				onFailure(error)
			}else if let responseObject = response.result.value{
				onSucceed(responseObject as! [String : Any])
			}
		}
	}

}
