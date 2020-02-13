//
//  ViewController.swift
//  CollapseTask
//
//  Created by Maryamalmoqbali on 2/12/20.
//  Copyright © 2020 Maryamalmoqbali. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDelegate,UICollectionViewDataSource{
 
    @IBOutlet weak var ItemsColView: UICollectionView!
    @IBOutlet weak var CatgColView: UICollectionView!
    @IBOutlet weak var buttonview: UIView!
    var imageArray = [UIImage(named: "Food icon"),UIImage(named: "Health icon"),UIImage(named: "Banking icon")]
    var itemimagArray = [UIImage(named: "Banner"),UIImage(named: "banner-1"),UIImage(named: "Banner-2")]
    var catgnames = ["Food and Beverages","Banking","Health"]
    var restnames = ["McDonald's","Shabestan","Haagen Dazs Café"]
    var restlogos = [UIImage(named: "Logo"),UIImage(named: "Logo-1"),UIImage(named: "Logo-2")]
    var advsdesc = ["Get burger for free","15% discount in all items","Get 2 scoop for free"]
    var adsDates = ["Until Dec 31,2019,2019","Until Dec 31,2019","Until Dec 31,2019"]
    override func viewDidLoad() {
        super.viewDidLoad()
        CatgColView.delegate = self
        ItemsColView.delegate = self
        // corner radius
        buttonview.layer.cornerRadius = 12

        // border
        buttonview.layer.borderWidth = 1.0
        buttonview.layer.borderColor = UIColor.white.cgColor

        // shadow
      
        buttonview.layer.shadowColor = UIColor.black.cgColor
        
      buttonview.layer.shadowOffset = CGSize(width: 3, height: 3)
        //buttonview.layer.shadowOpacity = 0.7
        //buttonview.layer.shadowRadius = 4.0
        // Do any additional setup after loading the view.
        
//        ItemsColView.backgroundColor = .white
//        ItemsColView.delegate = self
//        ItemsColView.dataSource = self
//        ItemsColView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
//        ItemsColView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
//        ItemsColView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
//        ItemsColView.heightAnchor.constraint(equalToConstant: view.frame.width/2).isActive = true
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == CatgColView){
            return imageArray.count
        }
        
        return itemimagArray.count
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = CatgColView.dequeueReusableCell(withReuseIdentifier: "categories", for: indexPath) as! CatgCollectionViewCell
        cell.CatgIcon.image = imageArray[indexPath.row]
        cell.CatgIcon.clipsToBounds = true
        cell.LblCatgName?.text = catgnames[indexPath.row]
        cell.LblCatgName?.textColor = UIColor.white
        
        if (collectionView == ItemsColView){
            let cell2 = ItemsColView.dequeueReusableCell(withReuseIdentifier: "Items", for: indexPath) as! ItemsCollectionViewCell
            cell2.ImgItem.image = imageArray[indexPath.row]
            cell2.ImgItem.clipsToBounds = true
            cell2.LblRestaurantName.text = restnames[indexPath.row]
            cell2.LblAdsDec.text = advsdesc[indexPath.row]
            cell2.LblAdsDate.text = adsDates[indexPath.row]
            cell2.ImgRestLogo.image = restlogos[indexPath.row]
            
            return cell2
            
            
        }
        
        return cell
        
     }
     

}

