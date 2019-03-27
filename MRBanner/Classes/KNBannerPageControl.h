//
//  KNBannerPageControl.h
//  KNBannerView
//
//  Created by MccRee on 2019/3/27.
//  Copyright © 2019年 MccRee. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KNBannerViewModel;

@interface KNBannerPageControl : UIView

@property (nonatomic, strong) KNBannerViewModel *bannerViewModel;

@property (nonatomic, assign) NSInteger currentPage;

@end
