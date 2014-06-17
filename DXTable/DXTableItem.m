//
//  DXTableItem.m
//  Pieces
//
//  Created by Alexander Ignatenko on 22/05/14.
//  Copyright (c) 2014 Alexander Ignatenko. All rights reserved.
//

#import "DXTableItem.h"

@interface DXTableItem ()

@property (nonatomic, copy) NSDictionary *options;

@end

@implementation DXTableItem

+ (NSPredicate *)predicateForEnabledItems
{
    return [NSPredicate predicateWithFormat:@"isEnabled = YES"];
}

- (instancetype)initWithOptions:(NSDictionary *)options
{
    self = [super init];
    if (self) {
        self.options = options;
        self.enabled = YES;
        if ([options[DXTableEnabledKey] isKindOfClass:[NSNumber class]]) {
            self.enabled = [options[DXTableEnabledKey] boolValue];
        }
    }
    return self;
}

- (id)objectForKeyedSubscript:(id)key
{
    return self.options[key];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %p; %@>",
            NSStringFromClass([self class]), self, self.options];
}

@end

NSString *const DXTableNameKey = @"name";
NSString *const DXTableTitleKey = @"title";
NSString *const DXTableHeightKey = @"height";
NSString *const DXTableEnabledKey = @"enabled";
NSString *const DXTableRepeatableKey = @"repeatable";
NSString *const DXTableListKey = @"list";
NSString *const DXTableEditingStyleKey = @"editingStyle";
NSString *const DXTablePropertiesKey = @"properties";
NSString *const DXTableActionsKey = @"actions";
NSString *const DXTableTargetKey = @"target";

#pragma mark - Parser

static NSString *const DXKeypathPrefix = @"@";
static NSString *const DXInnerKeyPathPrefix = @"@.";

NSString *DXTableParseKeyValue(id value)
{
    NSString *res;
    if ([value isKindOfClass:[NSString class]]) {
        NSString *string = value;
        for (NSString *prefix in @[DXInnerKeyPathPrefix, DXKeypathPrefix]) {
            if ([string hasPrefix:prefix]) {
                res = [string stringByReplacingOccurrencesOfString:prefix withString:@""];
                break;
            }
        }
    }
    return res;
}
