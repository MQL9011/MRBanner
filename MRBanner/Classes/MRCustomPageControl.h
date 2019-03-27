//
//  KNCustomPageControl.h
//  KNBannerView
//
//  Created by MccRee on 2019/3/27.
//  Copyright © 2019年 MccRee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MRCustomPageControl : UIView

@property (nonatomic, assign) NSInteger currentPage;
@property (nonatomic, assign) NSInteger numberOfPages;

@property (nonatomic, strong) NSArray *imageArr;

@end
