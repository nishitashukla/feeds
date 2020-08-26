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
    
    
    
    lazy var feedsViewModel:FeedsViewModel = {
        return FeedsViewModel()
    }()
    
    //MARK: LifeCycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
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
        self.navigationController?.navigationBar.barTintColor = UIColor.init(displayP3Red: 129/255.0,
                                                                             green: 23/255.0,
                                                                             blue: 23/255.0,
                                                                             alpha: 1.0)
        self.navigationController?.navigationBar.layoutIfNeeded()
        
        
    }
    
    //MARK: WebService Call
    func getList()
    {
        self.viewNoData.isHidden = false
        
        feedsViewModel.getFeedsListData { (result) in
            switch result
            {
            case .success(_):
                DispatchQueue.main.async {
                    
                    self.viewNoData.isHidden = true;
                }
            case .failure(let error):
                DispatchQueue.main.async
                    {
                        print(error.rawValue)
                }
            }
            
            DispatchQueue.main.async {
                self.viewLoading.isHidden = true
            }
            
        }
    }
    
    @IBAction func btnTryAgain(_ sender: UIButton)
    {
        getList()
    }
    
}
