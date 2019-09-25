//
//  GalleryTableViewController.swift
//  Gallery
//
//  Created by Piti Irawan on 2019/09/24.
//  Copyright © 2019 Piti Irawan. All rights reserved.
//

import UIKit

class GalleryTableViewController: UITableViewController {

    private var galleries: [[(name: String, data: [(url: URL, aspectRatio: Double)])]] = [[("One", []), ("Two", []), ("Three", [])], []]
    private var lastSeguedToIndexPath: IndexPath?
    private var lastSeguedToGalleryCollectionViewController: GalleryCollectionViewController?


    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    /*
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        if splitViewController?.preferredDisplayMode != .primaryOverlay {
            splitViewController?.preferredDisplayMode = .primaryOverlay
        }
    }
 */

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return galleries[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath)
        cell.textLabel?.text = galleries[indexPath.section][indexPath.row].name
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "chooseGallery" {
            if let tableViewCell = sender as? UITableViewCell {
                if let indexPath = tableView.indexPath(for: tableViewCell) {
                    if let galleryCollectionViewController = segue.destination as? GalleryCollectionViewController {
                        if let previousIndexPath = lastSeguedToIndexPath, let previousGalleryCollectionViewController = lastSeguedToGalleryCollectionViewController {
                            galleries[previousIndexPath.section][previousIndexPath.row].data = previousGalleryCollectionViewController.data
                        }
                        galleryCollectionViewController.data = galleries[indexPath.section][indexPath.row].data
                        lastSeguedToIndexPath = indexPath
                        lastSeguedToGalleryCollectionViewController = galleryCollectionViewController
                    }
                }
            }
        }
    }
}
