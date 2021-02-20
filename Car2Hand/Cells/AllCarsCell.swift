//
//  AllCarsCell.swift
//  Car2Hand
//
//  Created by bahadir on 14.02.2021.
//

import UIKit

class AllCarsCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var carImageView: UIImageView?
    @IBOutlet weak var carPriceLabel: UILabel?
    @IBOutlet weak var locationLabel: UILabel?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    //240x180
    func setupUI(for car: Cars) {
        carImageView?.setupImage(by: car.image, imageSize: "800x600")
        carPriceLabel?.text = String(car.fiyat!.formattedWithSeparator) + "₺"
        titleLabel?.text = car.baslik
        locationLabel?.text = (car.location?.cityName)! + "," + (car.location?.townName)!
    }
}
