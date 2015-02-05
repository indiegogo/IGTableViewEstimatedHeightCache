//
//  IGTableViewEstimatedHeightCacheTests.m
//  IGTableViewEstimatedHeightCacheTests
//
//  Created by janj on 02/04/2015.
//  Copyright (c) 2014 janj. All rights reserved.
//

@import UIKit;
#import <UITableViewController+IGTableViewEstimatedHeightCache.h>

SPEC_BEGIN(UITableViewController_IGTableViewEstimatedHeightCacheSpec)

describe(@"cache tests", ^{
    
    let(indexPath, ^NSIndexPath *{
        return [NSIndexPath indexPathForRow:10 inSection:10];
    });
    
    let(tableViewController, ^UITableViewController *{
        return [UITableViewController new];
    });
    
    context(NSStringFromSelector(@selector(ehc_setEstimatedCellHeightToCache:height:)), ^{
        context(@"setting a new value", ^{
            beforeEach(^{
                [tableViewController ehc_setEstimatedCellHeightToCache:indexPath height:300];
            });
            
            it(@"should set value", ^{
                [[theValue([tableViewController ehc_getEstimatedCellHeightFromCache:indexPath defaultHeight:10]) should] equal:theValue(300)];
            });
            
            it(@"should override previous cached height", ^{
                [[theValue([tableViewController ehc_getEstimatedCellHeightFromCache:indexPath defaultHeight:10]) should] equal:theValue(300)];
                [tableViewController ehc_setEstimatedCellHeightToCache:indexPath height:100];
                [[theValue([tableViewController ehc_getEstimatedCellHeightFromCache:indexPath defaultHeight:10]) should] equal:theValue(100)];
            });
            
        });
    });
    
    context(NSStringFromSelector(@selector(ehc_getEstimatedCellHeightFromCache:defaultHeight:)), ^{
        context(@"has previously cached height", ^{
            beforeEach(^{
                [tableViewController ehc_setEstimatedCellHeightToCache:indexPath height:200];
            });
            
            it(@"should return cached height", ^{
                [[theValue([tableViewController ehc_getEstimatedCellHeightFromCache:indexPath defaultHeight:10]) should] equal:theValue(200)];
            });
        });
        
        context(@"no previous height in cache", ^{
            it(@"should return default height", ^{
                [[theValue([tableViewController ehc_getEstimatedCellHeightFromCache:indexPath defaultHeight:10]) should] equal:theValue(10)];
            });
        });
    });
    
    context(NSStringFromSelector(@selector(ehc_isEstimatedRowHeightInCache:)), ^{
        context(@"no previous height in cache", ^{
            it(NSStringFromSelector(@selector(ehc_isEstimatedRowHeightInCache:)), ^{
                [[theValue([tableViewController ehc_isEstimatedRowHeightInCache:indexPath]) should] beNo];
            });
        });
        
        context(@"has previously cached height", ^{
            beforeEach(^{
                [tableViewController ehc_setEstimatedCellHeightToCache:indexPath height:200];
            });
            
            it(NSStringFromSelector(@selector(ehc_isEstimatedRowHeightInCache:)), ^{
                [[theValue([tableViewController ehc_isEstimatedRowHeightInCache:indexPath]) should] beYes];
            });
        });
    });
    
    context(NSStringFromSelector(@selector(ehc_clearAllEstimatedRowCache)), ^{
        let(secondIndexPath, ^NSIndexPath *{
            return [NSIndexPath indexPathForRow:190 inSection:10];
        });
        
        beforeEach(^{
            [tableViewController ehc_setEstimatedCellHeightToCache:indexPath height:200];
            [tableViewController ehc_setEstimatedCellHeightToCache:secondIndexPath height:200];
        });
        
        it(@"should clear all cached values", ^{
            [tableViewController ehc_clearAllEstimatedRowCache];
            [[theValue([tableViewController ehc_isEstimatedRowHeightInCache:indexPath]) should] beNo];
            [[theValue([tableViewController ehc_isEstimatedRowHeightInCache:secondIndexPath]) should] beNo];
        });
    });

    context(NSStringFromSelector(@selector(ehc_clearEstimatedRowCacheForIndexPath:)), ^{
        let(secondIndexPath, ^NSIndexPath *{
            return [NSIndexPath indexPathForRow:190 inSection:10];
        });
        
        beforeEach(^{
            [tableViewController ehc_setEstimatedCellHeightToCache:indexPath height:200];
            [tableViewController ehc_setEstimatedCellHeightToCache:secondIndexPath height:200];
        });
        
        it(@"should only clear specific cached values", ^{
            [tableViewController ehc_clearEstimatedRowCacheForIndexPath:secondIndexPath];
            [[theValue([tableViewController ehc_isEstimatedRowHeightInCache:indexPath]) should] beYes];
            [[theValue([tableViewController ehc_isEstimatedRowHeightInCache:secondIndexPath]) should] beNo];
        });
    });
});

SPEC_END
