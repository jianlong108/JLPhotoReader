//
//  JLPhotoReaderController.h
//  JLPhotoReader
//
//  Created by Wangjianlong on 2016/11/20.
//  Copyright © 2016年 JL. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JLPhoto;

@interface JLPhotoReaderController : UICollectionViewController
+ (instancetype)imageReaderViewControllerWithData:(NSArray<JLPhoto *> *)data TargetIndex:(NSUInteger)index;
@end
