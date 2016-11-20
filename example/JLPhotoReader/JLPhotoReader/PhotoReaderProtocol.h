//
//  PhotoReaderProtocol.h
//  JLPhotoReader
//
//  Created by Wangjianlong on 2016/11/20.
//  Copyright © 2016年 JL. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PhotoReader <NSObject>

- (NSURL *)assetURL;

/**net*/
@property (nonatomic, assign)BOOL isNetWorkAsset;

@end
