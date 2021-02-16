//
//  DetailViewController.swift
//  Car2Hand
//
//  Created by bahadir on 15.02.2021.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    private var currentCar: Cars?
    private var detaylar : CarDetail?
    private var interactor : CarsDetailInteractor = CarsDetailInteractor()
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //titleLabel.text = currentCar?.baslik
        setupUI()
       // webView.loadHTMLString(urlString, baseURL: nil)
    }
    
    func initialize(with car: Cars) {
        self.currentCar = car
    }
    
    func setupUI(){
        if let car = currentCar {
            interactor.fetchDetails(of: car, completion: {
                self.titleLabel.text = self.interactor.detail?.userInfo?.nameSurname
               // self.titleLabel.text = self.interactor.detail?.location?.cityName
                self.carImage.setupImage(by: self.interactor.detail!.image![0], imageSize: "800x600")
                let urlString = self.interactor.detail?.text
                self.webView.loadHTMLString(urlString!, baseURL: nil)
            })
        } else {
            print("girmedi :(")
        }
    }
        
    
}
