//
//  EditContactViewController.swift
//
//  Created by Nowfal E Salam on 21/09/19.
//  Copyright © 2019 Nowfal E Salam. All rights reserved.
//

import UIKit

public protocol AddProfileDelegate {
    func profileAdded( profile : Profile)
}

public class MishipayProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var selectedImage : UIImage?
    @IBOutlet weak var profilePic: RoundedCornerImageView!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var mobileNumber: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var firstName: UITextField!
    public var delegate : AddProfileDelegate? = nil
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override public func viewDidAppear(_ animated: Bool) {
        firstName.becomeFirstResponder()
    }
    
    private func dismiss(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        dismiss()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        if let first = firstName.text, let last = lastName.text, let email = email.text, let mobile = mobileNumber.text{
            if(first != "" && last != "" && email != "" && mobile != ""){
                let profile = Profile(name: "\(first) \(last)", mobile: mobile, email: email, image: selectedImage)
                UserDetails.sharedInstance.addProfile(profile: profile)
                delegate?.profileAdded(profile: profile)
                dismiss()
            } else {
                showAlert(message: "All fields are manadatory")
            }
        } else {
            showAlert(message: "All fields are manadatory")
        }
    }
    
    func showAlert(message : String){
        // create the alert
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertControllerStyle.alert)
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func cameraButtonTapped(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
            let imag = UIImagePickerController()
            imag.delegate = self
            imag.sourceType = UIImagePickerControllerSourceType.photoLibrary;
            imag.allowsEditing = false
            self.present(imag, animated: true, completion: nil)
        }
    }
    
        
    private func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            dismiss(animated: true, completion: nil)
    }

    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        selectedImage = image
        profilePic.image = image
        dismiss(animated:true, completion: nil)
    }
    
    
    @objc func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!) {
        selectedImage = image
        profilePic.image = selectedImage
        self.dismiss(animated: true, completion: nil)
    }
}
