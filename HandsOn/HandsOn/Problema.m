//
//  Problema.m
//  HandsOn
//
//  Created by Pedro Lopes on 4/8/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import "Problema.h"

@implementation Problema

+ (NSMutableArray *) retornaProblemas: (Area *)a
{
    NSMutableArray *listaProblemas = [[NSMutableArray alloc] init];
    
    NSString *string = [NSString stringWithFormat:@"http://betovieira.com.br/handson/retornadados.php?tipo_operacao=5&id_area=%d", a.id_area];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:string]];
    
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSArray *separaObjetos = [NSJSONSerialization JSONObjectWithData:response options:0 error:nil];
    
    NSDictionary *separaAtributos;
    
    for (int i = 0; i < separaObjetos.count; i++) {
        separaAtributos = [separaObjetos objectAtIndex:i];
        
        Problema *p = [[Problema alloc] init];
        p.id_problema = [[separaAtributos objectForKey:@"id_problema"] intValue];
        p.id_usuario = [[separaAtributos objectForKey:@"id_usuario"] intValue];
        p.id_area = [[separaAtributos objectForKey:@"id_area"] intValue];
        p.descricaoProblema = [separaAtributos objectForKey:@"descricaoProblema"];
        p.curtidasProblema = [[separaAtributos objectForKey:@"curtidasProblema"] intValue];
        
        [listaProblemas addObject:p];
    }
    
    return listaProblemas;
}

@end
