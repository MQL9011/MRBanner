//
//  KNBannerPageControl.h
//  KNBannerView
//
//  Created by MccRee on 2019/3/27.
//  Copyright © 2019年 MccRee. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MRBannerViewModel;

@interface MRBannerPageControl : UIView

@property (nonatomic, strong) MRBannerViewModel *bannerViewModel;

@property (nonatomic, assign) NSInteger currentPage;

@end
