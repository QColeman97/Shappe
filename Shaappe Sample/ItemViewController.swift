//
//  ItemViewController.swift
//  Shaappe Sample
//
//  Created by Quinn Coleman on 11/4/18.
//  Copyright © 2018 Cal Poly Mobile App Dev Club. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {

	@IBOutlet weak var thisItemImageView: UIImageView!
	@IBOutlet weak var itemTitleLabel: UILabel!
	@IBOutlet weak var itemPriceLabel: UILabel!
	@IBOutlet weak var itemDescriptionLabel: UILabel!
	@IBOutlet weak var likeDislikeView: UIProgressView!
	@IBOutlet weak var itemCommentsView: UITableView!
	
	var itemImage: UIImage?
	var apiWrapper: APIWrapper?
	var item: Item?
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		
		
		if let img = itemImage {
			thisItemImageView.image = img
		}
		
        // Do any additional setup after loading the view.
    }
    
	@IBAction func onShareButton(_ sender: UIButton) {
		
	}
	
	
	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
