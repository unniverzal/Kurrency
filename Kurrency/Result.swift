//
//  Result.swift
//  Kurrency
//
//  Created by Ard Stavileci on 7/16/17.
//  Copyright © 2017 Ard Stavileci. All rights reserved.
//

import Foundation
import ObjectMapper

class Result : Mappable {
	var results : [String:Any]?
	
	required init?(map: Map) {
		
	}
	
	func mapping(map: Map) {
		results <- map["results"]
	}
}
