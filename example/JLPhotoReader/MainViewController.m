//
//  MainViewController.m
//  JLPhotoReader
//
//  Created by Wangjianlong on 2016/11/19.
//  Copyright © 2016年 JL. All rights reserved.
//

#import "MainViewController.h"
#import "GirlsTableViewController.h"

@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>

/**data*/
@property (nonatomic, strong)NSMutableArray *datas;

@property (nonatomic, strong)NSMutableDictionary *datasDic;

/**table*/
@property (nonatomic, strong)UITableView *table;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle]pathForResource:@"channel" ofType:@"plist"];
    NSDictionary *dic =[[NSDictionary alloc]initWithContentsOfFile:path];
    self.datasDic = dic;
    self.datas = [NSMutableArray arrayWithArray:dic.allKeys];
    
    _table = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _table.delegate = self;
    _table.dataSource = self;
    [self.view addSubview:_table];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datas.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"reuseIdentifier"];
    }
    cell.textLabel.font = [UIFont systemFontOfSize:12];
    cell.textLabel.text = self.datas[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    GirlsTableViewController *girls = [[GirlsTableViewController alloc]initWithStyle:UITableViewStylePlain];
    girls.data= self.datasDic[self.datas[indexPath.row]];
    [self.navigationController pushViewController:girls animated:YES];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.y <100) {
        [self setNeedsStatusBarAppearanceUpdate];
    }else if (scrollView.contentOffset.y <200 && scrollView.contentOffset.y >100){
        [self setNeedsStatusBarAppearanceUpdate];
    }else{
        
    }
    
}
- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation{
    return UIStatusBarAnimationFade;
}
- (BOOL)prefersStatusBarHidden{
    return NO;
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    if (_table.contentOffset.y <100) {
        return UIStatusBarStyleLightContent;
    }else if (_table.contentOffset.y <200 && _table.contentOffset.y >100){
        return UIStatusBarStyleDefault;
    }else {
        return  UIStatusBarStyleDefault;
    }
}
@end
