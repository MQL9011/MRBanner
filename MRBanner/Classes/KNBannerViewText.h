//
//  KNBannerViewText.h
//  KNBannerView
//
//  Created by MccRee on 2019/3/27.
//  Copyright © 2019年 MccRee. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KNBannerViewModel;

@interface KNBannerViewText : UIView

/* 设置 属性  -- > 这个最好只设置一次*/
@property (nonatomic, strong) KNBannerViewModel *bannerViewModel;

/* 设置 文字 */
@property (nonatomic, copy  ) NSString *text;

@end
