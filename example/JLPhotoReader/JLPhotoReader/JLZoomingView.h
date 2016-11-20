//
//  JLZoomingView.h
//  JLPhotoReader
//
//  Created by Wangjianlong on 2016/11/20.
//  Copyright © 2016年 JL. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JLPhoto;

@interface JLZoomingView : UIScrollView

@property (nonatomic) JLPhoto * imageModel;


- (void)prepareForReuse;

- (void)displayImage;

- (void)displayImageWithFullScreenImage;
@end
