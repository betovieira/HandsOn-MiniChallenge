//
//  BancoDadosHelper.m
//  HandsOn
//
//  Created by Humberto Vieira de Castro on 4/14/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import "BancoDadosHelper.h"

@implementation BancoDadosHelper

NSURL *url;
NSMutableURLRequest *request;

+ (NSArray *) retornaDados:(NSString *)url_str
{
    url = [[NSURL alloc] init];
    url = [NSURL URLWithString:url_str];
    request = [[NSMutableURLRequest alloc] initWithURL:url
                                                                cachePolicy: NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                                                            timeoutInterval: 5];
    [request setHTTPShouldHandleCookies:NO];
    
    [NSURLConnection connectionWithRequest:request delegate:self];
    
    NSURLResponse *resp = nil;
    NSError *error = nil;
    
    NSData *response = [NSURLConnection sendSynchronousRequest: request returningResponse: &resp error: &error]
    ;
    //NSMutableString *responseString = [[NSMutableString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    //NSLog(@"%@",responseString);
    
    NSArray *separaObjetos = [NSJSONSerialization JSONObjectWithData:response options:0 error:nil];
    
    return separaObjetos;
    
}


@end
