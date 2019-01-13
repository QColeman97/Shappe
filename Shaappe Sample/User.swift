//
//  User.swift
//  Shaappe Sample
//
//  Created by Quinn Coleman on 11/11/18.
//  Copyright © 2018 Cal Poly Mobile App Dev Club. All rights reserved.
//

import Foundation

class User : Hashable {
	
	static func == (lhs: User, rhs: User) -> Bool {
		return true
	}
	
	func hash(into hasher: inout Hasher) {
		
	}
	
	init() {}
}
