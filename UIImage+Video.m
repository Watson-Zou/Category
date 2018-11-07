//
//  UIImage+Video.m
//  MyApp
//
//  Created by Watson on 2018/10/12.
//  Copyright © 2018年 Watson. All rights reserved.
//

#import "UIImage+Video.h"
#import <AVFoundation/AVFoundation.h>

@implementation UIImage (Video)

+ (UIImage *)imageWithVideoPath:(NSString *)path time:(NSInteger)second {
    //创建AVURLAsset对象
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:[NSURL fileURLWithPath:path] options:nil];
    //创建AVAssetImageGenerator对象
    AVAssetImageGenerator *gen = [[AVAssetImageGenerator alloc] initWithAsset:asset];
     //截图的时候调整到正确的方向
    gen.appliesPreferredTrackTransform = YES;
    //获取second帧处的视频截图
    CMTime time = CMTimeMake(second, 1);
    //保存实际截图的时间点
    CMTime acturalTime;
    //获取error
    NSError *error = nil;
    //截图-核心方法
    CGImageRef ref = [gen copyCGImageAtTime:time actualTime:&acturalTime error:&error];
    if (error == nil) {
        //将CGImageRef转换为image
        UIImage *image = [UIImage imageWithCGImage:ref];
        //释放位图对象，否则内存泄漏
        CGImageRelease(ref);
        return  image;
    } else {
        //截图失败
        NSLog(@"对视频截图时出现错误:%@",error);
        return nil;
    }
    
}

@end
