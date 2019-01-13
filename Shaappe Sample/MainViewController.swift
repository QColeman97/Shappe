//
//  ViewController.swift
//  Shaappe Sample
//
//  Created by Quinn Coleman on 10/28/18.
//  Copyright © 2018 Cal Poly Mobile App Dev Club. All rights reserved.
//

import UIKit
import SwiftySound

class MainViewController: UIViewController {

	@IBOutlet weak var shappeTitle: UILabel!
	
	@IBOutlet weak var itemImageView: UIImageView!
	@IBOutlet weak var itemTitleLabel: UILabel!
	
	var clicked = false
	var initialCenter = CGPoint()
	let clothesPics = ["boots.png", "carolina-shirt.jpg", "festival-shirt.jpg", "shirt-maps.jpg", "shore_shirt.jpg"]
	let clothesNames = ["Boots", "Carolina Shirt", "Festival Shirt", "Map Shirt", "Shores Shirt"]
	var clothesIndex = 0
	var apiWrapper: APIWrapper = APIWrapper()
	var items = [Item]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		//itemImageView.addGestureRecognizer(<#T##gestureRecognizer: UIGestureRecognizer##UIGestureRecognizer#>)
		//
		
		shappeTitle.text = "Shaappe 'til you draappe"
		itemImageView.isUserInteractionEnabled = true
		self.apiWrapper.getItems(numItems: 5, callback: {(items, error) in
			if error != nil {
				print(error)
			} else if let items = items{
				for item in items {
					self.items.append(item)
				}
			}
		})
		//Sound.play(file: "Wii_Shop_Channel_Music.mp3")
	}
	
	@IBAction func onPan(_ sender: UIPanGestureRecognizer) {
		
		//guard sender.view != nil else {return}  same thing as below line
		if let moveView = sender.view {
			
			let translation = sender.translation(in: moveView.superview)
			if sender.state == .began {
				self.initialCenter = moveView.center
			}
			else if sender.state == .changed {
				let newCenter = CGPoint(x: initialCenter.x + translation.x, y: initialCenter.y)
				moveView.center = newCenter
				
				moveView.alpha = CGFloat(1 - (abs(initialCenter.x - moveView.center.x) / initialCenter.x))
				
			}
			else {
				if let imageView = moveView as? UIImageView {
					imageView.image = UIImage(named: clothesPics[clothesIndex])
					itemTitleLabel.text = clothesNames[clothesIndex]
				}
				
				if (clothesIndex < (clothesPics.count - 1)) {
					clothesIndex += 1
				} else {
					clothesIndex = 0
				}
				
				moveView.center = initialCenter
				moveView.alpha = 1
				
				// Destroy current imageView, instantiate another
				
			}
		}
	}
	
	
	@IBAction func sampleButton(_ sender: UIButton) {
		
		if (clicked) {
			clicked = false
			shappeTitle.text = "Shaapping Spree!"
		} else {
			clicked = true
			shappeTitle.text = "Shaappe 'til you draappe"
		}
		let randIndex = Int.random(in: 0..<clothesPics.count)
		itemImageView.image = UIImage(named: clothesPics[randIndex])
		itemTitleLabel.text = clothesNames[randIndex]
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//		switch segue.identifier {
//		case "mainToItemSegue":
//			if let vc = segue.destination as? ItemViewController {
//				//vc.itemImage = self.itemImageView.image
//				vc.apiWrapper = self.apiWrapper
//				vc.item = // item associated w/ view
//			}
//		default:
//			print("gibberish")
//		}
	}
}

