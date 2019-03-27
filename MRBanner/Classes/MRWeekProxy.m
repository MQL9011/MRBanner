//
//  KNWeekProxy.m
//  KKRent
//
//  Created by MccRee on 2019/3/27.
//  Copyright © 2019年 MccRee. All rights reserved.
//

#import "MRWeekProxy.h"

@implementation MRWeekProxy

- (instancetype)initWithTarget:(id)target{
    _target = target;
    return self;
}

+ (instancetype)proxyWithTarget:(id)target{
    return [[self alloc] initWithTarget:target];
}

- (void)forwardInvocation:(NSInvocation *)invocation{
    SEL sel = [invocation selector];
    if([self.target respondsToSelector:sel]){
        [invocation invokeWithTarget:self.target];
    }
}

- (id)forwardingTargetForSelector:(SEL)selector {
    return _target;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel{
    return [NSObject instanceMethodSignatureForSelector:@selector(init)];
}

- (BOOL)respondsToSelector:(SEL)aSelector{
    return [_target respondsToSelector:aSelector];
}

@end
