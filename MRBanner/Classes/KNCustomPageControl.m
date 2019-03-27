//
//  KNCustomPageControl.m
//  KNBannerView
//
//  Created by MccRee on 2019/3/27.
//  Copyright © 2019年 MccRee. All rights reserved.
//

#import "KNCustomPageControl.h"

@interface KNCustomPageControl()

@property (nonatomic, strong) NSMutableArray *layerArr;
@property (nonatomic, assign) NSInteger  selectIndex;

@end

@implementation KNCustomPageControl{
    UIImage *_selectImg;
    UIImage *_unSelectImg;
}

- (NSMutableArray *)layerArr{
    if (!_layerArr) {
        _layerArr = [NSMutableArray array];
    }
    return _layerArr;
}

- (void)setCurrentPage:(NSInteger)currentPage{
    _currentPage = currentPage;
    
    if(self.layerArr.count == 0) return;
    
    CALayer *layer = _layerArr[_selectIndex];
    [layer setContents:(__bridge id _Nullable)_unSelectImg.CGImage];
    
    CALayer *layer1 = _layerArr[currentPage];
    [layer1 setContents:(__bridge id _Nullable)_selectImg.CGImage];
    _selectIndex = currentPage;
}

- (void)setImageArr:(NSArray *)imageArr{
    _imageArr    = imageArr;
    _selectImg   = imageArr[0];
    _unSelectImg = imageArr[1];
}

- (void)setNumberOfPages:(NSInteger)numberOfPages{
    for (NSInteger i = 0; i < self.layerArr.count; i++) {
        CALayer *layer = self.layerArr[i];
        [layer removeFromSuperlayer];
    }
    [self.layerArr removeAllObjects];
    
    for (NSInteger i = 0; i < numberOfPages; i++) {
        CALayer *layer = [CALayer layer];
        [layer setContents:(__bridge id _Nullable)_unSelectImg.CGImage];
        [self.layer addSublayer:layer];
        [self.layerArr addObject:layer];
    }
    
    CALayer *layer = self.layerArr[0];
    [layer setContents:(__bridge id _Nullable)_selectImg.CGImage];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat padding = 5;
    CGFloat width  = _selectImg.size.width;
    CGFloat height = _selectImg.size.height;
    for (NSInteger i = 0; i < _layerArr.count; i++) {
        CGFloat x = i * (width + padding) + padding;
        CGFloat y = (30 - height) * 0.5;
        CALayer *layer = _layerArr[i];
        [layer setFrame:(CGRect){{x,y},{width,height}}];
    }
}

@end
