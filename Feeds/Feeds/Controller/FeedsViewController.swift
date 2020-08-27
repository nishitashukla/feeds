//
//  FeedsViewController.swift
//  Feeds
//
//  Created by Nishita Shukla on 26/08/20.
//  Copyright © 2020 Nishita Shukla. All rights reserved.
//

import UIKit

class FeedsViewController: UIViewController
{
    //MARK: Variables
    @IBOutlet weak var viewNoData: UIView!
    @IBOutlet weak var viewLoading: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    
    
    lazy var feedsViewModel:FeedsViewModel = {
        return FeedsViewModel()
    }()
    
    //MARK: LifeCycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "PostCell", bundle: nil), forCellReuseIdentifier: "PostCell")
        
        initView()
        getList()
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        self.viewLoading.isHidden = false
    }
    
    //MARK: UI Styling
    
    func initView()
    {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "Feeds"
        self.navigationItem.hidesBackButton = true
        self.navigationController?.navigationBar.barTintColor = UIColor.init(displayP3Red: 129/255.0,green: 23/255.0,blue: 23/255.0,alpha: 1.0)
        self.navigationController?.navigationBar.layoutIfNeeded()
        
        self.tableView.isHidden = true
        self.viewNoData.isHidden = true
        
        tableView.estimatedRowHeight = 400
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    //MARK: WebService Call
    func getList()
    {
        self.viewNoData.isHidden = false
        self.viewLoading.isHidden = false
        
        feedsViewModel.getFeedsListData { (result) in
            switch result
            {
            case .success(_):
                DispatchQueue.main.async {
                    self.tableView.isHidden = false
                    self.viewNoData.isHidden = true;
                    self.tableView.reloadData()
                    
                }
            case .failure(let error):
                DispatchQueue.main.async
                    {
                        print(error.rawValue)
                        self.showAlert(_title: "Error Occurred", _message: error.rawValue, _buttonsDictionaryArray: [["title":"Try Again", "callBackFunction":"tryAgain", "isDestructive":"NO"],["title":"Cancel", "callBackFunction":"", "isDestructive":"YES"]], _parentView: self)
                        
                }
            }
            
            DispatchQueue.main.async {
                self.viewLoading.isHidden = true
            }
            
        }
    }
    
    
    func showAlert(_title: String, _message: String, _buttonsDictionaryArray:[[String:String]], _parentView: UIViewController, style:UIAlertController.Style = .alert)
    {
        let alert:UIAlertController = UIAlertController(title: _title, message: _message, preferredStyle: style)
        
        for dict in _buttonsDictionaryArray{
            let action:UIAlertAction = UIAlertAction(title: dict["title"], style: dict["isDestructive"] == "NO" ?UIAlertAction.Style.default : UIAlertAction.Style.destructive) { (UIAlertAction) in
                let callbackFunction:Selector = NSSelectorFromString(dict["callBackFunction"]!)
                if _parentView.responds(to: callbackFunction){
                    _parentView.perform(callbackFunction)
                }
            }
            alert.addAction(action)
        }
        _parentView.present(alert, animated: true, completion: nil)
    }
    
    @objc func tryAgain()
    {
        getList()
    }
    
}

extension FeedsViewController:UITableViewDelegate,UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedsViewModel.numberOfCells
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 450
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        let cellModel = feedsViewModel.getCellViewModel( at: indexPath )
        cell.feedsListCellModel = cellModel
        return cell
    }
    
    
}
