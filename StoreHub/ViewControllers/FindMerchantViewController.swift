//
//  FindMerchantViewController.swift
//  StoreHub
//
//  Created by Lainel John Dela Cruz on 16/10/2018.
//  Copyright © 2018 Lainel John Dela Cruz. All rights reserved.
//

import UIKit
import TesseractOCR
import SVProgressHUD;

class FindMerchantViewController: UIViewController, G8TesseractDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var fbCustom:FirebaseCustom?;
    var merchantInfo:Merchant?;
    @IBOutlet weak var UICodeTF: UITextField!
    var tesseract:G8Tesseract?;
    var tessProgress:UInt?;
    var imagePickerController:UIImagePickerController?
    var actionSheet:UIAlertController?;
    override func viewDidLoad() {
        super.viewDidLoad()
        self.merchantInfo=Merchant();
        self.navigationController?.isNavigationBarHidden=false;
        // Do any additional setup after loading the view.
        self.tesseract=G8Tesseract(language: "eng");
        self.tesseract?.delegate=self;
        //imagePicker
        self.imagePickerController=UIImagePickerController();
        self.imagePickerController?.delegate=self;
        self.InitUIAlertControllers();
    }
    func progressImageRecognition(for tesseract: G8Tesseract!) {
        self.tessProgress=tesseract.progress;
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //get image of words and extract it
    var textRecognize:String?;
    func RecognizeImage(image:UIImage){
        self.tesseract?.image=image.g8_blackAndWhite();
        self.tesseract?.recognize();
        self.UICodeTF.text=self.tesseract?.recognizedText;
        self.merchantInfo?.GetByMerchantID(id: (self.tesseract?.recognizedText!)!, fbCustom: self.fbCustom!, completionHandler: {
            (resp, err) in
            if err == nil{
                self.performSegue(withIdentifier: "findMerchantToStoreInfo", sender: nil);
            }else{
            }
        })
    }
    @IBAction func ScanCodeOnClick(_ sender: Any) {
        self.present(self.actionSheet!, animated: true, completion: nil)
    }
    func InitUIAlertControllers(){
        self.actionSheet=UIAlertController(title: "Scan Image", message: "Choose Source", preferredStyle: .actionSheet)
        self.actionSheet?.addAction(UIAlertAction(title: "Camera", style: .default, handler: {
            (action:UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                self.imagePickerController?.sourceType = .camera;
                self.present(self.imagePickerController!, animated: true, completion: nil)
            }else{
                print("Camera not available")
            }
        }))
        self.actionSheet?.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: {
            (action:UIAlertAction) in
            self.imagePickerController?.sourceType = .photoLibrary;
            self.present(self.imagePickerController!, animated: true, completion: nil);
        }))
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage;
        self.RecognizeImage(image: image);
        picker.dismiss(animated: true, completion: nil);
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "findMerchantToStoreInfo"{
            let destVC=segue.destination as! StoreInfoViewController;
            destVC.fbCustom=self.fbCustom;
        }
    }
    
    
    
}
