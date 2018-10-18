//
//  ViewController.m
//  KT_Kit
//
//  Created by Ki on 2018/10/18.
//  Copyright © 2018 Ki. All rights reserved.
//

#import "ViewController.h"
#import "Ctrls.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong)NSMutableArray * arr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView reloadData];
}

-(NSMutableArray *)arr{
    if (!_arr) {
        _arr = [NSMutableArray arrayWithObjects:@"Ctrls",@"Ctrls",@"Ctrls", nil];
    }
    return _arr;
}

#pragma mark - <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ktCellIdentifier"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"ktCellIdentifier"];
    }
    cell.textLabel.text = [self.arr objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * vcNameStr = [self.arr objectAtIndex:indexPath.row];
    
    
}


@end
