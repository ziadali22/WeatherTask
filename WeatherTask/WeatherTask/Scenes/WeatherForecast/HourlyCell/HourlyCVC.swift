//
//  HourlyCVC.swift
//  WeatherTask
//
//  Created by ziad on 25/03/2023.
//

import UIKit

class HourlyCVC: UICollectionViewCell {

    @IBOutlet weak var hour: UILabel!
    @IBOutlet weak var tempratureIcon: UIImageView!
    @IBOutlet weak var temprature: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        tempratureIcon.tintColor = .yellow
    }
    
    func configureCell(hour: String, tempreatureIcon: String, temprature: String ) {
        self.hour.text = hour
        self.tempratureIcon.image = UIImage(systemName: tempreatureIcon)
        self.temprature.text = temprature
    }

}
