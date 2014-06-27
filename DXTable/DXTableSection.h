//
//  DXTableSection.h
//  Pieces
//
//  Created by Alexander Ignatenko on 22/05/14.
//  Copyright (c) 2014 Alexander Ignatenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

#import "DXTableItem.h"

@class DXTableModel, DXTableRowArray;

extern NSString *const DXTableRowsKey;

@interface DXTableSection : DXTableItem

@property (nonatomic, weak, readonly) DXTableModel *tableModel;

@property (nonatomic, readonly) NSArray *allRows;
@property (nonatomic, readonly) DXTableRowArray *activeRows;

@property (nonatomic, readonly) NSString *headerTitle;
@property (nonatomic, readonly) NSString *footerTitle;

@property (nonatomic, readonly) DXTableItem *header;
@property (nonatomic, readonly) DXTableItem *footer;

@property (nonatomic, readonly) CGFloat headerHeight;
@property (nonatomic, readonly) CGFloat footerHeight;

- (instancetype)initWithModel:(DXTableModel *)tableModel
                      options:(NSDictionary *)options;

@end
