//
//  CoreDataServices.swift
//  Kurrency
//
//  Created by Ard Stavileci on 7/16/17.
//  Copyright © 2017 Ard Stavileci. All rights reserved.
//

import Foundation
import CoreData
import UIKit
class CoreDataServices {
	
	private let fetchRequest = NSFetchRequest<Currency>(entityName: "Currency")
	private var managedObjectContext = (UIApplication.shared.delegate as? AppDelegate)!.persistentContainer.viewContext

	static let shared = CoreDataServices()
	
	private init() {
	
	}
	
	func fetchCurrenciesFromCoreData() -> [Currency]{
		var currencies : [Currency] = []
		do {
			try currencies = managedObjectContext.fetch(fetchRequest)
		} catch let error as NSError  {
			print("Could not retrieve Recentle Visited Users \(error), \(error.userInfo)")
		}
		return currencies
	}
	
	func checkIfCurrencyExists(withId id :String)->Bool{
		
		let fetchRequest = NSFetchRequest<Currency>(entityName: "Currency")
		fetchRequest.predicate = NSPredicate(format: "id = %@",id )
		var fetchedObjects = [Currency]()
		do {
			try fetchedObjects =  managedObjectContext.fetch(fetchRequest)
		} catch let error as NSError  {
			print("Could not retrieve \(error), \(error.userInfo)")
		}
		if fetchedObjects.count == 0 {
			return true
		}
		return false
	}


}
