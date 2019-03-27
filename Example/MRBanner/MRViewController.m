//
//  MRViewController.m
//  MRBanner
//
//  Created by 301063915@qq.com on 03/27/2019.
//  Copyright (c) 2019 301063915@qq.com. All rights reserved.
//

#import "MRViewController.h"
#import <MRBanner/MRBanner.h>

//屏幕高度
#define H [UIScreen mainScreen].bounds.size.height
#define W [UIScreen mainScreen].bounds.size.width
#define kRatio  [UIScreen mainScreen].bounds.size.width/375
//适配iPhoneX的宏
#define iPhoneX (W == 375.f && H == 812.f ? YES : NO)
#define iPhoneXR ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhoneXMax (W == 414.f && H == 896.f ? YES : NO)
//刘海屏
#define k_FringeScreen (iPhoneX|iPhoneXMax ? YES : NO)

#define k_StatusBarH   (iPhoneX|iPhoneXMax ? 44.f : 20.f)
#define k_NaviBarH   44.f
#define k_TabbarH  (iPhoneX|iPhoneXMax ? (49.f+34.f) : 49.f)
#define k_StatusNaviH  (iPhoneX|iPhoneXMax ? 88.f : 64.f)

#define KNColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface MRViewController ()<MRBannerViewDelegate>

@property (nonatomic, strong) NSMutableArray *textArr;
@property (nonatomic, strong) NSMutableArray *urlArr;
@property (nonatomic,strong) NSMutableArray *changeArr;

@property (nonatomic,strong) NSMutableArray *colorArr;
@property (nonatomic,strong) NSMutableArray *changeColorArr;

@property (nonatomic,strong) UIImageView *curBackImageView;
@property (nonatomic,strong) UIImageView *nextBackImageView;

@property (nonatomic,strong) MRBannerView *bannerView;
@end

@implementation MRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"背景色切换";
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.curBackImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 90, self.view.frame.size.width, 180)];
    [self.view addSubview:self.curBackImageView];
    
    self.nextBackImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 90, self.view.frame.size.width, 180)];
    [self.view addSubview:self.nextBackImageView];
    
    self.bannerView = [self setupNetWorkBannerView1];
    [self.view addSubview:self.bannerView];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
}

// Banner样式
- (MRBannerView *)setupNetWorkBannerView1{
    CGRect frame = CGRectMake(0, 150, self.view.frame.size.width, 180);
    MRBannerView *bannerView = [MRBannerView bannerViewWithNetWorkImagesArr:self.urlArr
                                                                      frame:frame];
    
    /*
     * 以下都是 基本属性的设置
     */
    [bannerView setDelegate:self]; // 设置代理, 为了实现代理方法
    
    MRBannerViewModel *viewM = [[MRBannerViewModel alloc] init]; // 统一通过 设置 模型来设置 里面的参数
    [viewM setTextArr:[self.textArr copy]]; // 设置文字, 注意:如果文字和图片的数量不相符,则没有文字.如果不要文字,则不传
    [viewM setTextShowStyle:MRBannerViewTextShowStyleStay]; // 设置文字展示的样式
    
    [viewM setCurrentPageIndicatorTintColor:[UIColor orangeColor]];
    [viewM setPageIndicatorTintColor:[UIColor whiteColor]];
    [viewM setPageControlStyle:MRBannerPageControlStyleMiddel];
    [viewM setIsNeedTimerRun:true];
    [viewM setIsNeedCycle:true];
    [viewM setIsNeedPageControl:YES]; // 记得设置 YES
    [viewM setIsNeedCycle:YES];
    [viewM setBgChangeColorArr:self.colorArr.copy];
    [viewM setLeftMargin:15];
    [viewM setBannerCornerRadius:10];
    [bannerView setBannerViewModel:viewM]; // 通过模型设置属性 -->赋值
    
    [bannerView setTag:0]; // 标识是哪个bannerView
    return bannerView;
}

#pragma mark MRBannerDelegate

/**
 轮播图点击代理回调
 @param index
 */
- (void)bannerView:(MRBannerView *)bannerView collectionView:(UICollectionView *)collectionView collectionViewCell:(MRBannerCollectionViewCell *)collectionViewCell didSelectItemAtIndexPath:(NSInteger)index{
    
    NSLog(@"BannerView :%zd -- index :%zd",bannerView.tag,index);
}


/**
 轮播图滑动时背景色跟着变的代理回调
 @param bannerView 轮播图
 @param topColor 当前颜色
 @param bottomColor 下一个颜色
 @param alpha 透明度
 @param isRight 是否向右
 */
- (void)bannerView:(MRBannerView *)bannerView
          topColor:(UIColor *)topColor
       bottomColor:(UIColor *)bottomColor
             alpha:(CGFloat)alpha
           isRight:(BOOL)isRight{
    
    
    /* 这里是做判断 , 如果当前数据源 就一张图片时, 就不改变 背景色 */
    /* bannerView.netWorkImgArr 对应创建时 KNBannerView bannerViewWithNetWorkImagesArr  */
    if(bannerView.netWorkImgArr.count == 1){
        return;
    }
    
    if(topColor){
        self.curBackImageView.backgroundColor = topColor;
        if(bottomColor){
            if(isRight){
                self.curBackImageView.alpha = alpha;
            }else{
                self.curBackImageView.alpha = 1 - alpha;
            }
        }else{
            self.curBackImageView.alpha = 1.0;
        }
    }else{
        self.curBackImageView.backgroundColor = nil;
    }
    
    if(bottomColor){
        self.nextBackImageView.backgroundColor = bottomColor;
        if(isRight){
            self.nextBackImageView.alpha = 1 - alpha;
        }else{
            self.nextBackImageView.alpha = alpha;
        }
    }else{
        self.nextBackImageView.backgroundColor = nil;
        self.nextBackImageView.alpha = 0.0;
    }
}



- (NSMutableArray *)colorArr{
    if (!_colorArr) {
        _colorArr = [NSMutableArray array];
        [_colorArr addObject:KNColorFromRGB(0x5676F7)];
        [_colorArr addObject:KNColorFromRGB(0xE95B44)];
        [_colorArr addObject:KNColorFromRGB(0x25A053)];
    }
    return _colorArr;
}

- (NSMutableArray *)changeColorArr{
    if (!_changeColorArr) {
        _changeColorArr = [NSMutableArray array];
        [_changeColorArr addObject:KNColorFromRGB(0xE95B44)];
        [_changeColorArr addObject:KNColorFromRGB(0x25A053)];
    }
    return _changeColorArr;
}

- (NSMutableArray *)changeArr{
    if (!_changeArr) {
        
        _changeArr = [NSMutableArray array];
        
        NSString *url1 = @"https://wx4.sinaimg.cn/mw690/005TQtyLly1ft05o87llij312c0gwn0p.jpg";// 红色
        NSString *url2 = @"https://wx1.sinaimg.cn/mw690/005TQtyLly1ft05o8gwjij30j608g0u1.jpg";// 绿色
        
        [_changeArr addObject:url1];
        [_changeArr addObject:url2];
    }
    return _changeArr;
}

- (NSMutableArray *)urlArr{
    if (!_urlArr) {
        _urlArr = [NSMutableArray array];
        NSString *url1 = @"https://wx4.sinaimg.cn/mw690/005TQtyLly1ft05o8ru11j30j608gwfu.jpg";// 蓝色
        NSString *url2 = @"https://wx4.sinaimg.cn/mw690/005TQtyLly1ft05o87llij312c0gwn0p.jpg";// 红色
        NSString *url3 = @"https://wx1.sinaimg.cn/mw690/005TQtyLly1ft05o8gwjij30j608g0u1.jpg";// 绿色
        
        [_urlArr addObject:url1];
        [_urlArr addObject:url2];
        [_urlArr addObject:url3];
    }
    return _urlArr;
}

- (NSMutableArray *)textArr{
    if (!_textArr) {
        _textArr = [NSMutableArray array];
        
        [_textArr addObject:@"轮播图改版了"];
        [_textArr addObject:@"SDWebImage下载图片"];
        [_textArr addObject:@"通过模型统一设置属性"];
        [_textArr addObject:@"希望大家支持一下"];
        [_textArr addObject:@"谢谢大家!!!"];
    }
    return _textArr;
}
@end
