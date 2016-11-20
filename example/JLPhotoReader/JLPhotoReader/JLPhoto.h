//
//  JLPhoto.h
//  JLPhotoReader
//
//  Created by Wangjianlong on 2016/11/20.
//  Copyright © 2016年 JL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JLPhoto : NSObject
/**图像的url...ios8之后,是唯一标示,已经被包装为URL*/
@property (nonatomic, strong)NSURL *assetUrl;
/**是否为网络图片*/
@property (nonatomic, assign)BOOL isNetWorkAsset;

/**比例缩略图高宽比例 内部不要使用,赋值*/
@property (nonatomic, assign)CGFloat thumbnailScale;

/**asset*/
@property (nonatomic, strong)id asset;
/**当前是否被选中*/
@property (nonatomic, assign)BOOL isSelect;

@end
