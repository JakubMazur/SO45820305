//
//  ViewController.swift
//  SO45820305
//
//  Created by Jakub Mazur on 22/08/2017.
//  Copyright © 2017 Jakub Mazur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var collectionViewDataSet: [String] = [String]()


    func appendNewData(_ dataSet: [String]) {
        let currentItemsCount = self.collectionViewDataSet.count
        self.collectionViewDataSet.append(contentsOf: dataSet)
        var paths: [IndexPath] = [IndexPath]()
        for i in currentItemsCount...(currentItemsCount+dataSet.count-1) {
            paths.append(IndexPath(row: i, section: 0))
        }
        self.collectionView.insertItems(at: paths) /* crash on this line */
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let when = DispatchTime.now() + 2
        /* simulate internet connection */
        DispatchQueue.main.asyncAfter(deadline: when) {
            let exampleStrings: [String] = ["abc", "123", "example"]
            self.appendNewData(exampleStrings)
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExampleCell", for: indexPath as IndexPath)
        cell.backgroundColor = UIColor.red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.collectionViewDataSet.count
    }
}
