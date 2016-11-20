//
//  JLPhotoManager.m
//  JLPhotoReader
//
//  Created by Wangjianlong on 2016/11/20.
//  Copyright © 2016年 JL. All rights reserved.
//

#import "JLPhotoManager.h"
#import<AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>

#import "JLPhotoPrivateHeader.h"
#import "SDWebImageDecoder.h"
#import "SDWebImageManager.h"
#import "SDWebImageOperation.h"

@interface JLPhotoManager ()

@property (nonatomic, strong)id <SDWebImageOperation> webImageOperation;
@end

@implementation JLPhotoManager
static JLPhotoManager *manager;
+ (instancetype)defaultAssetManager{
    if (manager == nil) {
        manager = [[JLPhotoManager alloc]init];
    }
    return manager;
}
- (void)getAspectPhotoWithAsset:(JLPhoto *)imageModel photoWidth:(CGSize)photoSize completion:(void (^)(UIImage *photo,NSDictionary *info))completion{
    if (imageModel.isNetWorkAsset == NO) {
        if (iOS8Later) {
            //            [self ios8_AsyncLoadAspectThumbilImageWithSize:photoSize asset:imageModel completion:completion];
        }else {//ios8之前
            @try {
                ALAsset *asset = (ALAsset *)imageModel.asset;
                UIImage *aspectThumbnail = [UIImage imageWithCGImage:asset.aspectRatioThumbnail];
                if (completion) {
                    completion(aspectThumbnail,nil);
                }
            }
            @catch (NSException *e) {
                if (completion) {
                    completion(nil,nil);
                }
            }
        }
    }else {
        @try {
            SDWebImageManager *manager = [SDWebImageManager sharedManager];
            _webImageOperation = [manager downloadImageWithURL:imageModel.assetUrl
                                                       options:0
                                                      progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                                                          if (expectedSize > 0) {
                                                              float progress = receivedSize / (float)expectedSize;
                                                              NSDictionary* dict = [NSDictionary dictionaryWithObjectsAndKeys:
                                                                                    [NSNumber numberWithFloat:progress], @"progress",
                                                                                    self, @"photo", nil];
                                                              //                                                              [[NSNotificationCenter defaultCenter] postNotificationName:MWPHOTO_PROGRESS_NOTIFICATION object:dict];
                                                          }
                                                      }
                                                     completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
                                                         if (error) {
                                                             IPLog(@"SDWebImage failed to download image: %@", error);
                                                         }
                                                         _webImageOperation = nil;
                                                         dispatch_async(dispatch_get_main_queue(), ^{
                                                             if (completion) {
                                                                 completion(image,nil);
                                                             }
                                                         });
                                                     }];
        } @catch (NSException *e) {
            IPLog(@"Photo from web: %@", e);
            _webImageOperation = nil;
            if (completion) {
                completion(nil,nil);
            }
        }
    }

}
- (void)getFullScreenImageWithAsset:(JLPhoto *)imageModel photoWidth:(CGSize)photoSize completion:(void (^)(UIImage *photo,NSDictionary *info))completion{
    if (imageModel.isNetWorkAsset == NO) {
        if (iOS8Later) {
            //            [self ios8_AsyncLoadAspectThumbilImageWithSize:photoSize asset:imageModel completion:completion];
        }else {//ios8之前
            @try {
                ALAsset *asset = (ALAsset *)imageModel.asset;
                UIImage *aspectThumbnail = [UIImage imageWithCGImage:asset.aspectRatioThumbnail];
                if (completion) {
                    completion(aspectThumbnail,nil);
                }
            }
            @catch (NSException *e) {
                if (completion) {
                    completion(nil,nil);
                }
            }
        }
    }else {
        @try {
            SDWebImageManager *manager = [SDWebImageManager sharedManager];
            _webImageOperation = [manager downloadImageWithURL:imageModel.assetUrl
                                                       options:0
                                                      progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                                                          if (expectedSize > 0) {
                                                              float progress = receivedSize / (float)expectedSize;
                                                              NSDictionary* dict = [NSDictionary dictionaryWithObjectsAndKeys:
                                                                                    [NSNumber numberWithFloat:progress], @"progress",
                                                                                    self, @"photo", nil];
                                                              //                                                              [[NSNotificationCenter defaultCenter] postNotificationName:MWPHOTO_PROGRESS_NOTIFICATION object:dict];
                                                          }
                                                      }
                                                     completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
                                                         if (error) {
                                                             IPLog(@"SDWebImage failed to download image: %@", error);
                                                         }
                                                         _webImageOperation = nil;
                                                         dispatch_async(dispatch_get_main_queue(), ^{
                                                             if (completion) {
                                                                 completion(image,nil);
                                                             }
                                                         });
                                                     }];
        } @catch (NSException *e) {
            IPLog(@"Photo from web: %@", e);
            _webImageOperation = nil;
            if (completion) {
                completion(nil,nil);
            }
        }
    }

    
}

@end
