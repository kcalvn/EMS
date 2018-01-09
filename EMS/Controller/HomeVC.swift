//
//  HomeVC.swift
//  EMS
//
//  Created by Kevin C on 1/8/18.
//  Copyright © 2018 KevinC. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var jobTitle: UILabel!
    @IBOutlet weak var profileBtn: SquareButton!
    @IBOutlet weak var attendanceBtn: SquareButton!
    @IBOutlet weak var leaveReqBtn: SquareButton!
    @IBOutlet weak var jobLetterBtn: SquareButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        profileImage.layer.borderWidth = 1
        profileImage.layer.masksToBounds = false
        profileImage.layer.borderColor = UIColor.white.cgColor
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileImage.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func profileAction(_ sender: SquareButton) {
        
    }
    
    @IBAction func attendanceAction(_ sender: SquareButton) {
    }
    
    @IBAction func leaveReqAction(_ sender: SquareButton) {
    }
    
    @IBAction func jobLetter(_ sender: SquareButton) {
    }
}
