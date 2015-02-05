//
//  UIViewController+EstimatedHeightCache.m
//  IGTableViewEstimatedHeightCache
//
//  Created by Indiegogo Pair on 2/4/15.
//  Copyright (c) 2015 Indiegogo. All rights reserved.
//

#import "UIViewController+IGTableViewEstimatedHeightCache.h"
#import <objc/runtime.h>

@implementation UIViewController (IGTableViewEstimatedHeightCache)

#pragma mark - Properties

- (NSMutableDictionary *) estimatedRowHeightCache {
    
    NSMutableDictionary *cache = objc_getAssociatedObject(self, @selector(estimatedRowHeightCache));
    if (cache == nil) {
        cache = [NSMutableDictionary new];
        objc_setAssociatedObject(self, @selector(estimatedRowHeightCache), cache, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return cache;
}

#pragma mark -

#pragma mark - estimated height cache methods

- (void) ehc_setEstimatedCellHeightToCache:(NSIndexPath *) indexPath height:(CGFloat) height {
    [self.estimatedRowHeightCache setObject:@(height) forKey:[self cacheKeyForIndexPath:indexPath]];
}

- (CGFloat) ehc_getEstimatedCellHeightFromCache:(NSIndexPath *) indexPath defaultHeight:(CGFloat) defaultHeight {
    NSNumber *estimatedHeight = [self.estimatedRowHeightCache objectForKey:[self cacheKeyForIndexPath:indexPath]];
    if (estimatedHeight != nil) {
        return [estimatedHeight floatValue];
    }
    return defaultHeight;
}

- (BOOL) ehc_isEstimatedRowHeightInCache:(NSIndexPath *) indexPath {
    if ([self.estimatedRowHeightCache objectForKey:[self cacheKeyForIndexPath:indexPath]] != nil) {
        return YES;
    }
    return NO;
}

-(void) ehc_clearEstimatedRowCacheForIndexPath:(NSIndexPath *) indexPath {
    [self.estimatedRowHeightCache removeObjectForKey:[self cacheKeyForIndexPath:indexPath]];
}

- (void) ehc_clearAllEstimatedRowCache {
    [self.estimatedRowHeightCache removeAllObjects];
}

#pragma mark - Helpers

- (NSString *)cacheKeyForIndexPath:(NSIndexPath *)indexPath {
    return [NSString stringWithFormat:@"%ld-%ld", indexPath.section, indexPath.row];
}

@end
