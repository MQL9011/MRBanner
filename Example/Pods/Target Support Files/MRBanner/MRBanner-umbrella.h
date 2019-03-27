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

#import "MRBanner.h"
#import "MRBannerCollectionViewCell.h"
#import "MRBannerPageControl.h"
#import "MRBannerView.h"
#import "MRBannerViewModel.h"
#import "MRBannerViewText.h"
#import "MRCustomPageControl.h"
#import "MRWeekProxy.h"
#import "UIView+MRExtension.h"

FOUNDATION_EXPORT double MRBannerVersionNumber;
FOUNDATION_EXPORT const unsigned char MRBannerVersionString[];

