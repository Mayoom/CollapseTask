//
//  ViewController.swift
//  CollapseTask
//
//  Created by Maryamalmoqbali on 2/12/20.
//  Copyright © 2020 Maryamalmoqbali. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDelegate,UICollectionViewDataSource,UITextFieldDelegate,UIScrollViewDelegate{
 
    @IBOutlet weak var mainscrlview: UIScrollView!
    @IBOutlet weak var imgsearchiconview: UIView!
    @IBOutlet weak var txtsearch: UITextField!
    @IBOutlet weak var ItemsColView: UICollectionView!
    @IBOutlet weak var CatgColView: UICollectionView!
    @IBOutlet weak var buttonview: UIView!
  var dragOriginY = 0
    var defaultOffSet: CGPoint?
    var imageArray = [UIImage(named: "Food icon"),UIImage(named: "Banking icon"),UIImage(named: "Health icon")]
    var itemimagArray = [UIImage(named: "Banner"),UIImage(named: "banner-1"),UIImage(named: "Banner-2")]
    var catgnames = ["Food and Beverages","Banking","Health"]
    var restnames = ["McDonald's","Shabestan","Haagen Dazs Café"]
    var restlogos = [UIImage(named: "Logo"),UIImage(named: "Logo-1"),UIImage(named: "Logo-2")]
    var advsdesc = ["Get burger for free","15% discount in all items","Get 2 scoop for free"]
    var adsDates = ["Until Dec 31,2019,2019","Until Dec 31,2019","Until Dec 31,2019"]
    var isCellSelected = false
    var i = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        txtsearch.delegate = self
        mainscrlview.delegate = self
        let myColor = UIColor.white
        txtsearch.layer.borderColor = myColor.cgColor
        txtsearch.layer.borderWidth = 1.5
        txtsearch.layer.backgroundColor = myColor.cgColor
        txtsearch.layer.cornerRadius = 10
        imgsearchiconview.layer.cornerRadius = 10
        buttonview.layer.shadowColor = UIColor.black.cgColor
        buttonview.layer.shadowOpacity = 0.6
        buttonview.layer.shadowOffset = .zero
        buttonview.layer.shadowRadius = 5
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
        txtsearch.attributedPlaceholder = NSAttributedString(string: "   Search",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
       
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
//        cell.contentView.layer.cornerRadius = 1;
//      //  cell.contentView.layer.borderWidth = 1.0;
//       // cell.contentView.layer.borderColor = UIColor.clear.cgColor;
//       // cell.contentView.layer.masksToBounds = true;
//
//        cell.layer.shadowColor = UIColor.black.cgColor;
//     // cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
//        cell.layer.shadowRadius = 0.6;
//        cell.layer.shadowOpacity = 0.5;
//     //   cell.layer.masksToBounds = false;
//        cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
        if (collectionView == ItemsColView){
            let cell2 = ItemsColView.dequeueReusableCell(withReuseIdentifier: "Items", for: indexPath) as! ItemsCollectionViewCell
            cell2.ImgItem.image = itemimagArray[indexPath.row]
            cell2.ImgItem.clipsToBounds = true
            cell2.LblRestaurantName.text = restnames[indexPath.row]
            cell2.LblAdsDec.text = advsdesc[indexPath.row]
            cell2.LblAdsDate.text = adsDates[indexPath.row]
            cell2.ImgRestLogo.image = restlogos[indexPath.row]
            
            
            return cell2
            
            
        }
        
        return cell
        
     }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if isCellSelected {
//
//            i = indexPath.row
//            performSegue(withIdentifier: "showItemDetail", sender: self)
//            isCellSelected = !isCellSelected
//        }
//
//    }
//    override func viewWillAppear(_ animated: Bool) {
//        isCellSelected = !isCellSelected
//
//    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (collectionView == CatgColView){
        if indexPath.section == 0 {

            //First get your selected cell
            if let cell2 = collectionView.cellForItem(at: indexPath) as? ItemsCollectionViewCell {
               let myNotes = restnames[indexPath.row]
                cell2.LblRestaurantName.text = myNotes
                //Now get selected cell text here
                //update your section two array with new values
                //Reload your collection view.


            } else {
                // Error indexPath is not on screen: this should never happen.
            }
        }
    }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
        }
        // Do not add a line break
        return false
    }
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        CatgColView.frame = CGRect(x: 0.0, y: CatgColView.frame.origin.y-1, width: 375, height: ItemsColView.frame.height+1);
//  }
//  
  
}

