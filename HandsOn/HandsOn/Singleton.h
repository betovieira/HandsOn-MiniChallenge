//
//  Singleton.h
//  HandsOn
//
//  Created by Humberto Vieira de Castro on 5/7/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Singleton : NSObject {
    NSString *someProperty;
    NSString *id_problema;
    NSString *id_area;
    
}


@property (nonatomic, retain) NSString *someProperty;
@property (nonatomic, retain) NSString *id_problema;
@property (nonatomic, retain) NSString *id_area;


- (id)init;
+ (id)sharedManager;

@end
