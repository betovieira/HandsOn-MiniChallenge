//
//  Implementacao.m
//  HandsOn
//
//  Created by Pedro Lopes on 4/8/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import "Implementacao.h"

@implementation Implementacao


+ (NSMutableArray *) retornaImplementacoes
{
    NSMutableArray *listaImplementacoes = [[NSMutableArray alloc] init];
    
    NSString *string = [NSString stringWithFormat:@"http://betovieira.com.br/handson/retornadados.php?tipo_operacao=16"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:string]];
    
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSArray *separaObjetos = [NSJSONSerialization JSONObjectWithData:response options:0 error:nil];
    
    NSDictionary *separaAtributos;
    
    for (int i = 0; i < separaObjetos.count; i++) {
        separaAtributos = [separaObjetos objectAtIndex:i];
        
        Implementacao*i = [[Implementacao alloc] init];
        i.id_implementacao = [[separaAtributos objectForKey:@"id_implementacao"] intValue];
        i.id_solucao = [[separaAtributos objectForKey:@"id_solucao"] intValue];
        i.id_usuario = [[separaAtributos objectForKey:@"id_usuario"]intValue] ;
        i.id_area = [[separaAtributos objectForKey:@"id_area"]intValue];
        i.descricaoImplementacao = [separaAtributos objectForKey:@"descricaoImplementacao"] ;
        i.caminhoAnexoImplementacao = [separaAtributos objectForKey:@"caminhoAnexoImplementacao"];
        i.tags = [separaAtributos objectForKey:@"tags"];
        i.curtidasImplementacao = [[separaAtributos objectForKey:@"curtidasImplementacao"] intValue];
        
        
        [listaImplementacoes addObject:i];
    }
    
    return listaImplementacoes;
}

+ (NSMutableArray *) retornaImplementacoesPorArea:(Area *)a
{
    NSMutableArray *listaImplementacoesPorArea = [[NSMutableArray alloc] init];
    
    NSString *string = [NSString stringWithFormat:@"http://betovieira.com.br/handson/retornadados.php?tipo_operacao=17&id_area=%d", a.id_area];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:string]];
    
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSArray *separaObjetos = [NSJSONSerialization JSONObjectWithData:response options:0 error:nil];
    
    NSDictionary *separaAtributos;
    
    for (int i = 0; i < separaObjetos.count; i++) {
        separaAtributos = [separaObjetos objectAtIndex:i];
        
        Implementacao*i = [[Implementacao alloc] init];
        i.id_implementacao = [[separaAtributos objectForKey:@"id_implementacao"] intValue];
        i.id_solucao = [[separaAtributos objectForKey:@"id_solucao"] intValue];
        i.id_usuario = [[separaAtributos objectForKey:@"id_usuario"]intValue] ;
        i.id_area = [[separaAtributos objectForKey:@"id_area"]intValue];
        i.descricaoImplementacao = [separaAtributos objectForKey:@"descricaoImplementacao"] ;
        i.caminhoAnexoImplementacao = [separaAtributos objectForKey:@"caminhoAnexoImplementacao"];
        i.tags = [separaAtributos objectForKey:@"tags"];
        i.curtidasImplementacao = [[separaAtributos objectForKey:@"curtidasImplementacao"] intValue];
        
        
        [listaImplementacoesPorArea addObject:i];
    }
    
    return listaImplementacoesPorArea;
}


+ (NSMutableArray *) retornaImplementacoesCurtidas
{
    NSMutableArray *listaImplementacoesCurtidas = [[NSMutableArray alloc] init];
    
    NSString *string = [NSString stringWithFormat:@"http://betovieira.com.br/handson/retornadados.php?tipo_operacao=18"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:string]];
    
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSArray *separaObjetos = [NSJSONSerialization JSONObjectWithData:response options:0 error:nil];
    
    NSDictionary *separaAtributos;
    
    for (int i = 0; i < separaObjetos.count; i++) {
        separaAtributos = [separaObjetos objectAtIndex:i];
        
        Implementacao*i = [[Implementacao alloc] init];
        i.id_implementacao = [[separaAtributos objectForKey:@"id_implementacao"] intValue];
        i.id_solucao = [[separaAtributos objectForKey:@"id_solucao"] intValue];
        i.id_usuario = [[separaAtributos objectForKey:@"id_usuario"]intValue] ;
        i.id_area = [[separaAtributos objectForKey:@"id_area"]intValue];
        i.descricaoImplementacao = [separaAtributos objectForKey:@"descricaoImplementacao"] ;
        i.caminhoAnexoImplementacao = [separaAtributos objectForKey:@"caminhoAnexoImplementacao"];
        i.tags = [separaAtributos objectForKey:@"tags"];
        i.curtidasImplementacao = [[separaAtributos objectForKey:@"curtidasImplementacao"] intValue];
        
        
        [listaImplementacoesCurtidas addObject:i];
    }
    
    return listaImplementacoesCurtidas;
}



@end
