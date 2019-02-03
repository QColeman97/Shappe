//
//  Item.swift
//  
//
//  Created by Quinn Coleman on 11/11/18.
//

import Foundation

class Item
{
	var name = ""
	var pic = ""
	var price = ""
	var currency = ""
	var id = ""
	
	init(name: String?, pic: String?) {
		self.name = name ?? ""
		self.pic = pic ?? ""
	}
}
