# IGTableViewEstimatedHeightCache

Simple solution for adding estimated height cache to table view controller

Based on StackOverflow.com answer (http://stackoverflow.com/a/26371697/40444) by Kai Burghardt (http://stackoverflow.com/users/1978096/kai-burghardt)

[![CI Status](http://img.shields.io/travis/IndieGoGo/IGTableViewEstimatedHeightCache.svg?style=flat)](https://travis-ci.org/IndieGoGo/IGTableViewEstimatedHeightCache)
[![Version](https://img.shields.io/cocoapods/v/IGTableViewEstimatedHeightCache.svg?style=flat)](http://cocoadocs.org/docsets/IGTableViewEstimatedHeightCache)
[![License](https://img.shields.io/cocoapods/l/IGTableViewEstimatedHeightCache.svg?style=flat)](http://cocoadocs.org/docsets/IGTableViewEstimatedHeightCache)
[![Platform](https://img.shields.io/cocoapods/p/IGTableViewEstimatedHeightCache.svg?style=flat)](http://cocoadocs.org/docsets/IGTableViewEstimatedHeightCache)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

IGTableViewEstimatedHeightCache is available through [CocoaPods](http://cocoapods.org). 

This pod comes in two different flavors 'Simple Magic', or 'Manual Caching Only' (i.e. No Simple Magic).

### 'Simple Magic' 

In the 'Simple Magic' configuration height caching is automatically enabled for all UITableViewController instances, without requiring you to make any code changes.

You can install this configuration by adding the following to your Podfile: 
it, simply add the following line to your Podfile and run ```pod install```:

    pod "IGTableViewEstimatedHeightCache/SimpleMagic"

This installs the SimpleMagic subspec, and enables caching. That's it! 

If you have a custom UITableViewDelegate implementation, or use a UITableView without a UITableViewController you can implement manual caching (see below). 

### 'Manual Caching Only'

In the 'Manual Caching Only' configuration, the 'Simple Magic' logic isn't installed, requiring you to manually control caching in your UITableViewController, or UITableViewDelegate. Although it's not as simple, it's still pretty easy. 

To install 
it, simply add the following line to your Podfile and run ```pod install```:

    pod "IGTableViewEstimatedHeightCache"

### Using IGTableViewEstimatedHeightCache with Manual Caching on a UITableViewController / UITableView + UITableViewDelegate
1. Import 'UITableViewController+IGTableViewEstimatedHeightCache.h in your UITableViewController / UITableViewDelegate implementation:
```#import "UITableViewController+IGTableViewEstimatedHeightCache.h"```
1. In your UITableViewDelegate implement the following methods to enable caching
```    
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self ehc_setEstimatedCellHeightToCache:indexPath height:cell.frame.size.height];
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self ehc_getEstimatedCellHeightFromCache:indexPath defaultHeight:[tableView estimatedRowHeight]];
}
```

Then you're done! 

## How 'Smart Magic' works

Simple Magic works, by adding a category to UITableViewController to implement the following methods to enable caching
```    
    - (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
    - (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath 
```
See [UITableViewController+SimpleEstimatedHeightMagic.m](https://github.com/IndieGoGo/IGTableViewEstimatedHeightCache/blob/master/Pod/Classes/UITableViewController%2BSimpleEstimatedHeightMagic.m) for more details.

If you're implementing these methods yourself you, or should be able to keep doing so by just calling super in your subclasses. But if you run into issues, or have a custom UITableViewDelegate you can fall back to using 'Manual Caching' as needed.



## Author
Indiegogo, tech+gogopair at indiegogo.com

janj, jan.jirout at indiegogo.com

glentregoning, glen.tregoning at indiegogo.com

## License

IGTableViewEstimatedHeightCache is available under the MIT license. See the LICENSE file for more info.

