//
//  UIImage+Video.h
//  MyApp
//
//  Created by Watson on 2018/10/12.
//  Copyright © 2018年 Watson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Video)


/**
 视频截图

 @param path 视频路径
 @param second 截图帧数
 @return 截图对象
 */
+ (UIImage *)imageWithVideoPath:(NSString *)path time:(NSInteger)second;

@end
