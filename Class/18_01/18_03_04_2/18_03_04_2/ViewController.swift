//
//  ViewController.swift
//  18_03_04_2
//
//  Created by 배지호 on 2018. 3. 4..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var timesWornLabel: UILabel!
    @IBOutlet weak var lastWornLabel: UILabel!
    @IBOutlet weak var favoriteLabel: UILabel!
    
    var managedContext: NSManagedObjectContext!
    var currentBowtie: Bowtie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        insertSampleDate()
        
        let request: NSFetchRequest<Bowtie> = Bowtie.fetchRequest()
        let firstTitle = segmentedControl.titleForSegment(at: 0)!
        request.predicate = NSPredicate(format: "%K = %@", argumentArray: [#keyPath(Bowtie.searchKey), firstTitle])
        do {
            let results = try managedContext.fetch(request)
            populate(bowtie: results.first!)
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    @IBAction func segmentedControl(_ sender: Any) {
        guard let control = sender as? UISegmentedControl,
        let selectedValue = control.titleForSegment(at: control.selectedSegmentIndex) else { return }
        let request = NSFetchRequest<Bowtie>(entityName: "Bowtie")
        request.predicate = NSPredicate(format: "%K = %@", argumentArray: [#keyPath(Bowtie.searchKey), selectedValue])
        do {
            let results = try managedContext.fetch(request)
            currentBowtie = results.first
            populate(bowtie: currentBowtie)
        } catch let error as NSError {
            print("Could net fetch \(error), \(error.userInfo)")
        }
    }
    
    @IBAction func wear(_ sender: Any) {
        let times = currentBowtie.timesWorn
        currentBowtie.timesWorn = times + 1
        
        currentBowtie.lastWorn = NSDate()
        
        do {
            try managedContext.save()
            populate(bowtie: currentBowtie)
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    @IBAction func rate(_ sender: Any) {
        let alert = UIAlertController(title: "New Rating", message: "Rate this bow tie", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.keyboardType = .decimalPad
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        let saveAction = UIAlertAction(title: "Save", style: .default) { [unowned self] action in
            guard let textField = alert.textFields?.first else { return }
            self.update(rating: textField.text)
        }
        alert.addAction(cancelAction)
        alert.addAction(saveAction)
        present(alert, animated: true, completion: nil)
    }
    
    func update(rating: String?) {
        guard let ratingString = rating,
        let rating = Double(ratingString) else { return }
        do {
            currentBowtie.rating = rating
            try managedContext.save()
            populate(bowtie: currentBowtie)
        } catch let error as NSError {
            if error.domain == NSCocoaErrorDomain && (error.code == NSValidationNumberTooLargeError || error.code == NSValidationNumberTooLargeError) {
                rate(currentBowtie)
            } else {
                print("Could not save \(error), \(error.userInfo)")
            }
        }
    }
    
    func insertSampleDate() {
        let fetch: NSFetchRequest<Bowtie> = Bowtie.fetchRequest()
        fetch.predicate = NSPredicate(format: "searchKey != nil")
        let count = try! managedContext.count(for: fetch)
        if count > 0 {
            //SampleData.plist data already in Core Data
            return
        }
        let path = Bundle.main.path(forResource: "SampleData", ofType: "plist")
        let dataArray = NSArray(contentsOfFile: path!)!
        
        for dict in dataArray {
            let entity = NSEntityDescription.entity(forEntityName: "Bowtie", in: managedContext)!
            let bowtie = Bowtie(entity: entity, insertInto: managedContext)
            let btDict = dict as! [String: Any]
            
            bowtie.id = UUID(uuidString: btDict["id"] as! String)
            bowtie.name = btDict["name"] as? String
            bowtie.searchKey = btDict["searchKey"] as? String
            bowtie.rating = btDict["rating"] as! Double
            let colorDict = btDict["tintColor"] as! [String: Any]
            bowtie.tintColor = UIColor.color(dict: colorDict)
            
            let imageName = btDict["imageName"] as? String
            let image = UIImage(named: imageName!)
            let photoData = UIImagePNGRepresentation(image!)!
            bowtie.photoData = NSData(data: photoData)
            bowtie.lastWorn = btDict["lastWorn"] as? NSDate
            
            let timesNumber = btDict["timesWorn"] as! NSNumber
            bowtie.timesWorn = timesNumber.int32Value
            bowtie.isFavorite = btDict["isFavorite"] as! Bool
            bowtie.url = URL(string: btDict["url"] as! String)
        }
        try! managedContext.save()
    }
    
    func populate(bowtie: Bowtie) {
        guard let imageData = bowtie.photoData as Data?,
        let lastWorn = bowtie.lastWorn as Date?,
        let tintColor = bowtie.tintColor as? UIColor else { return }
        imageView.image = UIImage(data: imageData)
        nameLable.text = bowtie.name
        ratingLabel.text = "Rating: \(bowtie.rating)/5"
        timesWornLabel.text = "# times worn: \(bowtie.timesWorn)"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        
        lastWornLabel.text = "Last worn: " + dateFormatter.string(from: lastWorn)
        favoriteLabel.isHidden = !bowtie.isFavorite
        view.tintColor = tintColor
    }
}

private extension UIColor {
    static func color(dict: [String: Any]) -> UIColor? {
        guard let red = dict["red"] as? NSNumber,
        let green = dict["green"] as? NSNumber,
        let blue = dict["blue"] as? NSNumber else { return nil }
        return UIColor(red: CGFloat(truncating: red) / 255.0,
                       green: CGFloat(truncating: green) / 255.0,
                       blue: CGFloat(truncating: blue) / 255.0,
                       alpha: 1)
    }
}
