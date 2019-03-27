//
//  KNBannerCollectionViewCell.m
//  KNBannerView
//
//  Created by MccRee on 2019/3/27.
//  Copyright © 2019年 MccRee. All rights reserved.
//


#import "KNBannerCollectionViewCell.h"
#import "UIView+KNExtension.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "KNBannerViewModel.h"
#import "KNBannerViewText.h"

@interface KNBannerCollectionViewCell(){
    KNBannerViewText *_viewText; // 显示 文字的 view
}

@end

@implementation KNBannerCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupImageView];
    }
    return self;
}

- (void)setupImageView{
    UIImageView *imageView = [[UIImageView alloc] init];
    [imageView setUserInteractionEnabled:YES];
    imageView.clipsToBounds = true;
    [self.contentView addSubview:imageView];
    _imageView = imageView;
    
    KNBannerViewText *viewText = [[KNBannerViewText alloc] init];
    _viewText = viewText;
    [self addSubview:viewText];
}

- (void)setUrl:(NSString *)url{
    __weak typeof(self) weakSelf = self;
    
    SDWebImageManager *mgr = [SDWebImageManager sharedManager];
    [[mgr imageCache] queryCacheOperationForKey:url done:^(UIImage * _Nullable image, NSData * _Nullable data, SDImageCacheType cacheType) {
        if(image){
            [_imageView setImage:image];
            [weakSelf layoutSubviews];
        }else{
            [_imageView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:weakSelf.placeHolder completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                if(!error){
                    [weakSelf layoutSubviews];
                }
            }];
        }
    }];
}

- (void)setBannerViewModel:(KNBannerViewModel *)bannerViewModel{
    _bannerViewModel = bannerViewModel;
    
    if(![bannerViewModel isNeedText]){
        [_viewText setHidden:YES];
    }else{
        [_viewText setBannerViewModel:_bannerViewModel];
    }
}

- (void)setText:(NSString *)text{
    _text = text;
    [_viewText setText:text];
}

- (void)setImage:(UIImage *)image{
    [_imageView setImage:image];
    [self layoutSubviews];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    if(_leftMargin == 0 && _bannerCornerRadius == 0){ // 无 圆角 && 无 左右间距
        [_imageView setFrame:self.bounds];
    }else{
        if(_bannerCornerRadius != 0 && _bannerCornerRadius != _imageView.layer.cornerRadius){
            _imageView.layer.cornerRadius = _bannerCornerRadius;
            [_imageView setFrame:self.bounds];
        }
        
        if(_leftMargin != 0){
            [_imageView setFrame:CGRectMake(_leftMargin, 0, self.width - 2 * _leftMargin, self.height)];
        }
    }
    [_viewText setFrame:CGRectMake(0, self.height - TextHeight, self.width,TextHeight)];
}


@end
