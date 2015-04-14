//
//  BancoDadosHelper.m
//  HandsOn
//
//  Created by Humberto Vieira de Castro on 4/14/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import "BancoDadosHelper.h"

@implementation BancoDadosHelper


+ (NSArray *) retornaDados:(NSString *)url
{
    NSMutableArray *listaAreas = [[NSMutableArray alloc] init];
    
    NSString *string = url;
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:string]];
    
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSArray *separaObjetos = [NSJSONSerialization JSONObjectWithData:response options:0 error:nil];
    
    return separaObjetos;
}




@end
