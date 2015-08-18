//
//  ViewController.h
//  PlistTest
//
//  Created by csdc-iMac on 15/8/17.
//  Copyright (c) 2015年 csdc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) NSMutableArray *listData;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

