//
//  NewWorkerViewController.swift
//  TestProject
//
//  Created by Viktoriia Skvarko on 08.04.2021.
//

import UIKit
import CoreData

class NewWorkerViewController: UITableViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var secondNameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    
    var companyNameText: String?
    
    let urlStr = "https://picsum.photos/200"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(tapped))
        photo.addGestureRecognizer(recognizer)
        
        if companyNameText == nil {
            companyName.text = "Компания"
        } else {
            companyName.text = companyNameText
        }
    }
    
    
    @IBAction func saveButton(_ sender: Any) {
        createPersonList()
        savedAlert()
    }
    
    
    func createPersonList() {
        
        let personData = NSEntityDescription.insertNewObject(forEntityName: "WorkerEntity", into: context)
        
        personData.setValue(nameTextField.text, forKey: "name")
        personData.setValue(secondNameTextField.text, forKey: "secondName")
        personData.setValue(birthdayTextField.text, forKey: "birthday")
        personData.setValue(companyName.text, forKey: "company")
        personData.setValue(urlStr, forKey: "image")
        
        do
            {
                try context.save()
                print("saved")
            }
        catch { }
        
    }
    
    func savedAlert() {
        let savedMessege = UIAlertController(title: "Сообщение", message: "Данные успешно сохранены", preferredStyle: .alert)
        savedMessege.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(savedMessege, animated: true)
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    
    @objc func tapped(_ recognizer: UITapGestureRecognizer) {
        if let url = URL(string: urlStr) {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        self.photo.image = image
                    }
                    
                }
            }
            task.resume()
        }
    }
}
