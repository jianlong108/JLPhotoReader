//
//  JLPhotoManager.h
//  JLPhotoReader
//
//  Created by Wangjianlong on 2016/11/20.
//  Copyright © 2016年 JL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JLPhoto.h"
#import "PhotoReaderProtocol.h"

@interface JLPhotoManager : NSObject
+ (instancetype)defaultAssetManager;
- (void)getAspectPhotoWithAsset:(id<PhotoReader>)imageModel photoWidth:(CGSize)photoSize completion:(void (^)(UIImage *photo,NSDictionary *info))completion;
- (void)getFullScreenImageWithAsset:(id<PhotoReader>)imageModel photoWidth:(CGSize)photoSize completion:(void (^)(UIImage *photo,NSDictionary *info))completion;
@end
