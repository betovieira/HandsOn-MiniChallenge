//
//  Area.m
//  HandsOn
//
//  Created by Pedro Lopes on 4/8/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import "Area.h"
#import "BancoDadosHelper.h"

@implementation Area

- (NSMutableArray *) retornaAreasTodas
{
    NSMutableArray *listaAreas = [[NSMutableArray alloc] init];
    @try {
        NSString *string = @"http://betovieira.com.br/handson/retornadados.php?tipo_operacao=3";
        
        NSArray *separaObjetos = [BancoDadosHelper retornaDados:string];
        
        NSDictionary *separaAtributos;
        
        for (int i = 0; i < separaObjetos.count; i++) {
            separaAtributos = [separaObjetos objectAtIndex:i];
            
            Area *a = [[Area alloc] init];
            a.id_area = [[separaAtributos objectForKey:@"id_area"] intValue];
            a.nomeArea = [separaAtributos objectForKey:@"nomeArea"];
            a.r = [[separaAtributos objectForKey:@"r"] intValue];
            a.g = [[separaAtributos objectForKey:@"g"] intValue];
            a.b = [[separaAtributos objectForKey:@"b"] intValue];
            
            [listaAreas addObject:a];
        }
        
        return listaAreas;
    }@catch (NSException *e){
        NSLog(@"%@", e);
        return nil;
    }

}
/*USANDO*/
@end
