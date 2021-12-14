//
//  ViewController.swift
//  ImagePickerTest
//
//  Created by elly on 2021/12/14.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    
    @IBOutlet weak var profileImage: UIImageView!
    
    var cnt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func buttonDidTap(_ sender: UIButton) {
        let actionSheet = UIAlertController(title: "프로필 사진 가져오기", message: "", preferredStyle: UIAlertController.Style.actionSheet)
        
        let optCamera = UIAlertAction(title: "카메라", style: UIAlertAction.Style.default, handler: {(actionSheet: UIAlertAction!) in
            self.presentCamera()
        })
        let optAlbum = UIAlertAction(title: "앨범", style: UIAlertAction.Style.default, handler: {(actionSheet: UIAlertAction!) in
            self.presentAlbum()
        })
        let optCancel = UIAlertAction(title: "취소" , style: UIAlertAction.Style.cancel,handler: { (action: UIAlertAction!) in  })
        actionSheet.addAction(optCamera)
        actionSheet.addAction(optAlbum)
        actionSheet.addAction(optCancel)
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func presentCamera(){
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.delegate = self
        vc.allowsEditing = true
        vc.cameraFlashMode = .on
        
        present(vc, animated: true, completion: nil)
    }
    
    func presentAlbum(){
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        
        present(vc, animated: true, completion: nil)
    }
    
    //카메라나 앨범등 PickerController가 사용되고 이미지 촬영을 했을 때 발동 된다.
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            print("picker -> \(String(describing: info[UIImagePickerController.InfoKey.imageURL]))")
       
            if cnt % 2 == 0 {

                if let image = info[.editedImage] as? UIImage {
                    profileImage.image = image
                }

            }
            else{

                if let image = info[.originalImage] as? UIImage {
                    profileImage.image = image
                }

            }
            
            cnt += 1
            
            print(cnt)
            dismiss(animated: true, completion: nil)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            dismiss(animated: true, completion: nil)
        }
}
