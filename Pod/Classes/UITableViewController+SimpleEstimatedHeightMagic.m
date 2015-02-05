//
//  UITableViewController+SimpleEstimatedHeightMagic.m
//  Pods
//
//  Created by Indiegogo Pair on 2/5/15.
//
//

#import "UITableViewController+IGTableViewEstimatedHeightCache.h"

@implementation UITableViewController (SimpleEstimatedHeightMagic)

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self ehc_setEstimatedCellHeightToCache:indexPath height:cell.frame.size.height];
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self ehc_getEstimatedCellHeightFromCache:indexPath defaultHeight:[tableView estimatedRowHeight]];
}

@end
