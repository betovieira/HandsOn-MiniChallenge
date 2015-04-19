//
//  Solucao.m
//  HandsOn
//
//  Created by Pedro Lopes on 4/8/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import "Solucao.h"

@implementation Solucao

- (NSMutableArray *) retornaSolucoes
{
    NSMutableArray *listaSolucoes = [[NSMutableArray alloc] init];
    
    NSString *string = [NSString stringWithFormat:@"http://betovieira.com.br/handson/retornadados.php?tipo_operacao=10"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:string]];
    
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSArray *separaObjetos = [NSJSONSerialization JSONObjectWithData:response options:0 error:nil];
    
    NSDictionary *separaAtributos;
    
    for (int i = 0; i < separaObjetos.count; i++) {
        separaAtributos = [separaObjetos objectAtIndex:i];
        
        Solucao*s = [[Solucao alloc] init];
        s.id_solucao = [[separaAtributos objectForKey:@"id_solucao"] intValue];
        s.id_problema = [[separaAtributos objectForKey:@"id_problema"] intValue];
        s.id_area =[[separaAtributos objectForKey:@"id_area"] intValue];
        s.descricaoSolucao = [separaAtributos objectForKey:@"descricaoSolucao"] ;
        s.caminhoAnexoSolucao = [separaAtributos objectForKey:@"caminhoAnexoSolucao"];
        s.interesses = [separaAtributos objectForKey:@"interesses"] ;
        s.curtidasSolucao = [[separaAtributos objectForKey:@"curtidasSolucao"] intValue];

        
        [listaSolucoes addObject:s];
    }
    
    return listaSolucoes;
}
/* USANDO */

- (NSMutableArray *) retornaSolucoesPorID:(Solucao *)s
{
    NSMutableArray *listaSolucoesPorID = [[NSMutableArray alloc] init];
    
    NSString *string = [NSString stringWithFormat:@"http://betovieira.com.br/handson/retornadados.php?tipo_operacao=11&id_solucao=%d", s.id_solucao];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:string]];
    
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSArray *separaObjetos = [NSJSONSerialization JSONObjectWithData:response options:0 error:nil];
    
    NSDictionary *separaAtributos;
    
    for (int i = 0; i < separaObjetos.count; i++) {
        separaAtributos = [separaObjetos objectAtIndex:i];
        
        Solucao*s = [[Solucao alloc] init];
        s.id_solucao = [[separaAtributos objectForKey:@"id_solucao"] intValue];
        s.id_problema = [[separaAtributos objectForKey:@"id_problema"] intValue];
        s.descricaoSolucao = [separaAtributos objectForKey:@"descricaoSolucao"] ;
        s.caminhoAnexoSolucao = [separaAtributos objectForKey:@"caminhoAnexoSolucao"];
        s.interesses = [separaAtributos objectForKey:@"interesses"] ;
        s.curtidasSolucao = [[separaAtributos objectForKey:@"curtidasSolucao"] intValue];
        
        
        [listaSolucoesPorID addObject:s];
    }
    
    return listaSolucoesPorID;
}

- (NSMutableArray *) retornaSolucoesPorArea:(Area *)a
{
    NSMutableArray *listaSolucoesPorArea = [[NSMutableArray alloc] init];
    
    NSString *string = [NSString stringWithFormat:@"http://betovieira.com.br/handson/retornadados.php?tipo_operacao=12&id_area=%d", a.id_area];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:string]];
    
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSArray *separaObjetos = [NSJSONSerialization JSONObjectWithData:response options:0 error:nil];
    
    NSDictionary *separaAtributos;
    
    for (int i = 0; i < separaObjetos.count; i++) {
        separaAtributos = [separaObjetos objectAtIndex:i];
        
        Solucao*s = [[Solucao alloc] init];
        s.id_solucao = [[separaAtributos objectForKey:@"id_solucao"] intValue];
        s.id_problema = [[separaAtributos objectForKey:@"id_problema"] intValue];
        s.descricaoSolucao = [separaAtributos objectForKey:@"descricaoSolucao"] ;
        s.caminhoAnexoSolucao = [separaAtributos objectForKey:@"caminhoAnexoSolucao"];
        s.interesses = [separaAtributos objectForKey:@"interesses"] ;
        s.curtidasSolucao = [[separaAtributos objectForKey:@"curtidasSolucao"] intValue];
        
        
        [listaSolucoesPorArea addObject:s];
    }
    
    return listaSolucoesPorArea;
}

- (NSMutableArray *) retornaSolucoesCurtidas
{
    NSMutableArray *listaSolucoesCurtidas = [[NSMutableArray alloc] init];
    
    NSString *string = [NSString stringWithFormat:@"http://betovieira.com.br/handson/retornadados.php?tipo_operacao=13"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:string]];
    
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSArray *separaObjetos = [NSJSONSerialization JSONObjectWithData:response options:0 error:nil];
    
    NSDictionary *separaAtributos;
    
    for (int i = 0; i < separaObjetos.count; i++) {
        separaAtributos = [separaObjetos objectAtIndex:i];
        
        Solucao*s = [[Solucao alloc] init];
        s.id_solucao = [[separaAtributos objectForKey:@"id_solucao"] intValue];
        s.id_problema = [[separaAtributos objectForKey:@"id_problema"] intValue];
        s.descricaoSolucao = [separaAtributos objectForKey:@"descricaoSolucao"] ;
        s.caminhoAnexoSolucao = [separaAtributos objectForKey:@"caminhoAnexoSolucao"];
        s.interesses = [separaAtributos objectForKey:@"interesses"] ;
        s.curtidasSolucao = [[separaAtributos objectForKey:@"curtidasSolucao"] intValue];
        
        
        [listaSolucoesCurtidas addObject:s];
    }
    
    return listaSolucoesCurtidas;
}

- (NSInteger*) retornaQuantidadeImplementacoes:(NSInteger *) id_sol
{
    NSInteger retorno = 0;
    
    NSString *string = [NSString stringWithFormat:@"http://betovieira.com.br/handson/retornadados.php?tipo_operacao=14&id_solucao=%d",id_sol];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:string]];
    
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSArray *separaObjetos = [NSJSONSerialization JSONObjectWithData:response options:0 error:nil];
    
    NSDictionary *separaAtributos;
    
    for (int i = 0; i < separaObjetos.count; i++) {
        separaAtributos = [separaObjetos objectAtIndex:i];
        
        retorno = [[separaAtributos objectForKey:@"retorno"] integerValue];
    }
    
    return retorno;
}

- (NSMutableArray *) retornaImplementacoesPorSolucao:(Solucao *)s
{
    NSMutableArray *listaImplementacoesPorSolucao= [[NSMutableArray alloc] init];
    
    NSString *string = [NSString stringWithFormat:@"http://betovieira.com.br/handson/retornadados.php?tipo_operacao=15&id_solucao=%d", s.id_solucao];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:string]];
    
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSArray *separaObjetos = [NSJSONSerialization JSONObjectWithData:response options:0 error:nil];
    
    NSDictionary *separaAtributos;
    
    for (int i = 0; i < separaObjetos.count; i++) {
        separaAtributos = [separaObjetos objectAtIndex:i];
        
        Solucao*s = [[Solucao alloc] init];
        s.id_solucao = [[separaAtributos objectForKey:@"id_solucao"] intValue];
        s.id_problema = [[separaAtributos objectForKey:@"id_problema"] intValue];
        s.descricaoSolucao = [separaAtributos objectForKey:@"descricaoSolucao"] ;
        s.caminhoAnexoSolucao = [separaAtributos objectForKey:@"caminhoAnexoSolucao"];
        s.interesses = [separaAtributos objectForKey:@"interesses"] ;
        s.curtidasSolucao = [[separaAtributos objectForKey:@"curtidasSolucao"] intValue];
        
        
        [listaImplementacoesPorSolucao addObject:s];
    }
    
    return listaImplementacoesPorSolucao;
}


@end
