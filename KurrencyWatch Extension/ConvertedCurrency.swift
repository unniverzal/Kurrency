//
//  ConvertetCurrency.swift
//  Kurrency
//
//  Created by Ard Stavileci on 7/17/17.
//  Copyright © 2017 Ard Stavileci. All rights reserved.
//

import Foundation
import ObjectMapper

class ConvertedCurrency: Mappable {
	
	var to: String!
	var val: Double!
	
	required init?(map: Map) {

	}
	
	func mapping(map: Map) {
		val   <- map["val"]
		to <- map["to"]
	}
}
