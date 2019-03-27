//
//  KNBannerCollectionViewCell.h
//  KNBannerView
//
//  Created by MccRee on 2019/3/27.
//  Copyright © 2019年 MccRee. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MRBannerViewModel;

@interface MRBannerCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) MRBannerViewModel *bannerViewModel;
/* 网络图片 url */
@property (nonatomic, copy  ) NSString *url;
/* 本地图片名 */
@property (nonatomic, strong) UIImage *image;
/* 当前文字 */
@property (nonatomic, copy  ) NSString *text;
/* 占位图 */
@property (nonatomic, strong) UIImage *placeHolder;
/* 是否设置过 KNBannerViewModel */
@property (nonatomic, assign) NSInteger isSet;
/* .m文件中所需要的imageView */
@property (nonatomic, strong) UIImageView *imageView;

/* 2018/05/04 -> banner是否需要 左右间距 || 圆角 */
@property (nonatomic,assign) CGFloat  leftMargin;
@property (nonatomic,assign) CGFloat  bannerCornerRadius;

@property (nonatomic,strong) UIColor *bgChangeColor;

@end
