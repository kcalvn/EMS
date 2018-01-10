//
//  ProfileTVC.swift
//  EMS
//
//  Created by Kevin C on 1/10/18.
//  Copyright © 2018 KevinC. All rights reserved.
//

import UIKit

class ProfileTVC: UITableViewController,UIGestureRecognizerDelegate {

    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var dobTF: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImage.layer.borderWidth = 1
        profileImage.layer.masksToBounds = false
        profileImage.layer.borderColor = UIColor.white.cgColor
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileImage.clipsToBounds = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(_:)))
        tapGesture.numberOfTapsRequired = 1
        profileImage.isUserInteractionEnabled = true
        profileImage.addGestureRecognizer(tapGesture)
    }
    
    @IBAction func changePhoto(_ sender: UIButton) {
        openChangeImageActionSheet()
    }
    
    @objc func handleTapGesture(_ gesture: UISwipeGestureRecognizer){
        openChangeImageActionSheet()
    }
    
    func openChangeImageActionSheet(){
        
        let actionSheetController = UIAlertController(title: "", message: "Choose a work friendly photo", preferredStyle: .actionSheet)
        
        let takePhotoBtn = UIAlertAction(title: "Take Photo", style: .default) { (action) in
            print("Take Photo")
        }
        actionSheetController.addAction(takePhotoBtn)
        
        let chooseFromLibrary = UIAlertAction(title: "Choose from Library", style: .default) { (action) in
            print("Choose from Library")
        }
        actionSheetController.addAction(chooseFromLibrary)
        
        
        let cancelBtn = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
           
        }
        actionSheetController.addAction(cancelBtn)
        
        self.present(actionSheetController, animated: true, completion: nil)
    }
    
    @IBAction func choseDOB(_ sender: UITextField) {
        
        let datePickerView:UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(self.datePickerValueChange(sender:)), for: UIControlEvents.valueChanged)
        
    }
    
    @objc func  datePickerValueChange(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeStyle = DateFormatter.Style.none
        
        dobTF.text = dateFormatter.string(from: sender.date)
        
    }
    
    

    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        guard gestureRecognizer.isEqual(self.navigationController?.interactivePopGestureRecognizer) else {return true}
        let pointofTouch = gestureRecognizer.location(in: self.view)
        let isTouchInBottomhalf = (pointofTouch.y >= self.view.bounds.height / 2)
        return !isTouchInBottomhalf
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 5
        }else if section == 1 {
            return 5
        }
        return 0
    }    
    
    @IBAction func close(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
