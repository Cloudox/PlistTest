//
//  ViewController.m
//  PlistTest
//
//  Created by csdc-iMac on 15/8/17.
//  Copyright (c) 2015年 csdc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 读取plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"List" ofType:@"plist"];// 找到plist文件
    NSArray *array = [[NSArray alloc] initWithContentsOfFile:path];// 获取文件列表
    self.listData = [NSMutableArray arrayWithArray:array];
    NSLog(@"%@", self.listData);
    
    // 去除多余列表线条
    self.tableView.tableFooterView = [[UIView alloc]init];
    
    // 删除plist
    [self.listData removeObjectAtIndex:2];
    [self.listData writeToFile:path atomically:YES];// 写入文件
    array = nil;
    array = [[NSArray alloc] initWithContentsOfFile:path];// 重新获取
    NSLog(@"%@", array);
    [self.listData removeAllObjects];
    [self.listData addObjectsFromArray:array];
    [self.tableView reloadData];// 重置列表
    
    // 添加plist
    [self.listData addObject:@"java"];
    [self.listData writeToFile:path atomically:YES];
    array = nil;
    array = [[NSArray alloc] initWithContentsOfFile:path];
    NSLog(@"%@", array);
    [self.listData removeAllObjects];
    [self.listData addObjectsFromArray:array];
    [self.tableView reloadData];
    
    // 修改plist
    [self.listData replaceObjectAtIndex:2 withObject:@"database"];
    [self.listData writeToFile:path atomically:YES];
    array = nil;
    array = [[NSArray alloc] initWithContentsOfFile:path];
    NSLog(@"%@", array);
    [self.listData removeAllObjects];
    [self.listData addObjectsFromArray:array];
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark TableView Data Source Methods
// 列表的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.listData count];
}

// 列表每行的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleTableIdentifier];
    }
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [self.listData objectAtIndex:row];
    return cell;
}

@end
