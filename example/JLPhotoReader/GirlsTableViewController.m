//
//  GirlsTableViewController.m
//  JLPhotoReader
//
//  Created by Wangjianlong on 2016/11/19.
//  Copyright © 2016年 JL. All rights reserved.
//

#import "GirlsTableViewController.h"
//#import "IPImageReaderViewController.h"
//#import "IPAssetModel.h"
#import "JLPhotoReaderController.h"
#import "JLPhoto.h"

@interface GirlsTableViewController ()

@end

@implementation GirlsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"girls"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return self.data.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"girls" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"girls"];
    }
    NSDictionary *dic = self.data[indexPath.row];
    cell.textLabel.text = dic.allKeys.firstObject;
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dic = self.data[indexPath.row];
    NSArray *array = dic.allValues.firstObject;
    NSMutableArray *arr_m = [NSMutableArray arrayWithCapacity:array.count];
//    for (NSString *str  in array) {
//        IPAssetModel *model = [[IPAssetModel alloc]init];
//        model.isNetWorkAsset = YES;
//        model.assetUrl = [NSURL URLWithString:str];
//        [arr_m addObject:model];
//        
//    }
    for (NSString *str  in array) {
        JLPhoto *model = [[JLPhoto alloc]init];
        model.isNetWorkAsset = YES;
        model.assetUrl = [NSURL URLWithString:str];
        [arr_m addObject:model];
        
    }
    
//    IPImageReaderViewController *girlReader =[IPImageReaderViewController imageReaderViewControllerWithData:arr_m TargetIndex:0];
    JLPhotoReaderController *girlReader = [JLPhotoReaderController imageReaderViewControllerWithData:arr_m TargetIndex:0];
    [self.navigationController pushViewController:girlReader animated:YES];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
