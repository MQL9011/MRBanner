#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "KNBannerCollectionViewCell.h"
#import "KNBannerPageControl.h"
#import "KNBannerView.h"
#import "KNBannerViewModel.h"
#import "KNBannerViewText.h"
#import "KNCustomPageControl.h"
#import "KNWeekProxy.h"
#import "MRBanner.h"
#import "UIView+KNExtension.h"

FOUNDATION_EXPORT double MRBannerVersionNumber;
FOUNDATION_EXPORT const unsigned char MRBannerVersionString[];

