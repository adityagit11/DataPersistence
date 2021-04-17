//
//  UserDefaultUtil.swift
//  DataPersistence
//
//  Created by Aditya Singh on 17/04/21.
//

import Foundation

class Human: NSObject, NSCoding
{
	let firstName: String
	let lastName: String
	
	// Designated initializers is primary initializers for a class.
	// It initializes all properties introduced by class and calls appropriate superclass initializer to continue the initializer process up the super class chain.
	init(firstName: String, lastName: String)
	{
		self.firstName = firstName
		self.lastName = lastName
	}
	
	func encode(with coder: NSCoder)
	{
		coder.encode(firstName, forKey: "firstName")
		coder.encode(lastName, forKey: "lastName")
	}
	
	// Convenience Initializer are secondary, supporting initializers for a class.
	convenience required init?(coder: NSCoder) {
		
		guard let firstName = coder.decodeObject(forKey: "firstName") as? String,
			  let lastName = coder.decodeObject(forKey: "lastName") as? String
		else{
			return nil
		}
		
		self.init(firstName: firstName, lastName: lastName)
	}
}

class UserDefaultUtil
{
	func storeCustomObjectToUserDefault()
	{
		let human = Human(firstName: "Aditya", lastName: "Singh")
		let data = try? NSKeyedArchiver.archivedData(withRootObject: human, requiringSecureCoding: true)
		UserDefaults.standard.set(data, forKey: "data")
	}
	
	func getCustomeObjectFromUserDefault() -> Human?
	{
		if let data = UserDefaults.standard.object(forKey: "data")
		{
			let convertedData = data as! Data
			do
			{
				let human = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(convertedData) as! Human
				return human
			}
			catch
			{
				print("Error!")
				return nil
			}
		}
		return nil
	}
	
}
