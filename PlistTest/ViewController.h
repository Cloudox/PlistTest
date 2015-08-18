//
//  ViewController.h
//  PlistTest
//
//  Created by csdc-iMac on 15/8/17.
//  Copyright (c) 2015年 csdc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> // 添加TableView委托
@property (strong, nonatomic) NSMutableArray *listData;// 用来存储plist内容
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

