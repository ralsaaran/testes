//
//  favorite.swift
//  arabic speaker
//
//  Created by Rawan Alsaaran on 10/22/1438 AH.
//  Copyright © 1438 Rawan Alsaaran. All rights reserved.
//

import UIKit


protocol ButtonCellFav {
    func ButtonShareCell(titel : String)
    func ButtonRemoveCell(titel : String)

}


class favorite: UITableViewCell {

    //out put arabic text
    @IBOutlet var outputLabel: UILabel!
    @IBOutlet var ShareCellFav: UIButton!
    @IBOutlet var RemoveCellFav: UIButton!
    
    
    let positions : Int = 0
    
    var dalegate : ButtonCellFav?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func commonInit(_ title : String){
    outputLabel.text = title
    }

    //add to Favorite page
    @IBAction func buttonFavorite(_ sender: UIButton) {
      //  self.dataSource.removeAtIndex(index)
        //dalegate?.ButtonRemoveCell(titel : String)
       
    }
    
    // convert text to speech
    @IBAction func speakerinput(_ sender: UIButton) {
    }
    
    //share text in soial medai
    @IBAction func SharaText(_ sender: UIButton) {
        dalegate?.ButtonShareCell(titel: outputLabel.text!)
    }
    
}
