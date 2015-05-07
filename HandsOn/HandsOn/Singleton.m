//
//  Singleton.m
//  HandsOn
//
//  Created by Humberto Vieira de Castro on 5/7/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import "Singleton.h"
#import "SolucoesAdapterViewObject.h"

@implementation Singleton


@synthesize someProperty;
@synthesize id_area;
@synthesize id_problema;

#pragma mark Singleton Methods

+ (id)sharedManager {
    static Singleton *sharedMyManager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
        
    });
    return sharedMyManager;
}

- (id)init {
    if (self = [super init]) {
        someProperty = @"Default Property Value";
    }
    return self;
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}





@end
