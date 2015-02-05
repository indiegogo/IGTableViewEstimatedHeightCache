//
//  UIViewController+EstimatedHeightCache.h
//  IGTableViewEstimatedHeightCache
//
//  Created by Indiegogo Pair on 2/4/15.
//  Copyright (c) 2015 Indiegogo. All rights reserved.
//

#import <UIKit/UIKit.h>

///////////////////////////////////////////////////////////////////////////
// Height Cache Solution based on post by Kai Burghardt on Stack Overflow
// http://stackoverflow.com/a/26371697/40444
///////////////////////////////////////////////////////////////////////////
@interface UIViewController (IGTableViewEstimatedHeightCache)

- (void) ehc_setEstimatedCellHeightToCache:(NSIndexPath *) indexPath height:(CGFloat) height;

- (CGFloat) ehc_getEstimatedCellHeightFromCache:(NSIndexPath *) indexPath defaultHeight:(CGFloat) defaultHeight;

- (BOOL) ehc_isEstimatedRowHeightInCache:(NSIndexPath *) indexPath;

- (void) ehc_clearEstimatedRowCacheForIndexPath:(NSIndexPath *) indexPath;

- (void) ehc_clearAllEstimatedRowCache;

@end
