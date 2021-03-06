//
//  DashboardViewController.swift
//  StoreHub
//
//  Created by Lainel John Dela Cruz on 15/10/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import UIKit


class DashboardViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var UIMostBought: UICollectionView!
    var fbCustom:FirebaseCustom?;
    var items=[1,2,3,4,5,6,7,8,9];
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count;
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "customCell1", for: indexPath) as! CustomCell1CollectionViewCell
        cell.UIProduct.text! = ""+String(self.items[indexPath.row]);
        return cell;
    }
    @IBAction func OnLogoutClick(_ sender: Any) {
        self.fbCustom?.Logout(completionHandler: {
            (isSuccess) in
            if isSuccess == true{
                self.navigationController?.popToRootViewController(animated: true);
            }
        });
    }
    @IBAction func GotoMerchantClick(_ sender: Any) {
        self.performSegue(withIdentifier: "dashboardToFindMerchant", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "dashboardToFindMerchant"{
            let destVC=segue.destination as! FindMerchantViewController;
            destVC.fbCustom=self.fbCustom;
        }
    }
    
    
    
    
    
    
    
}
