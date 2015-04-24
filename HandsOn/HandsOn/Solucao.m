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


-(bool) cadastroSolucao :(Solucao *)s
{
    
    @try {
        NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://betovieira.com.br/handson/inseredados.php"]];
        
        [urlRequest setHTTPMethod:@"POST"];
        
        NSString *postString = [NSString stringWithFormat:@"tipo_operacao=4&id_problema=%d&descricaoSolucao=%@&caminhoAnexoSolucao=%@&interesse=%@&id_area=%d&descricaoTotalSolucao=%@&caminhoLink=%@",s.id_problema, s.descricaoSolucao, s.caminhoAnexoSolucao, s.interesses, s.id_area, s.descricaoTotalSolucao, s.caminhoLink];
        
        [urlRequest setValue:[NSString stringWithFormat:@"%lu", (unsigned long) [postString length]] forHTTPHeaderField:@"Content-length"];
        
        [urlRequest setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
        
        //NSURLConnection *c = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
        NSData *response = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:nil error:nil];
        NSArray *separaObjetos = [NSJSONSerialization JSONObjectWithData:response options:0 error:nil];
        NSDictionary *separaAtributos = [separaObjetos objectAtIndex:0];
        
        NSString *retorno = [separaAtributos objectForKey:@"retorno"];
        
        NSLog(@"S: %@", retorno);
        
        return [[separaAtributos objectForKey:@"retorno"] boolValue];
        
    }
    @catch(NSException *e)
    {
        return false;
    }
    
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
        s.descricaoTotalSolucao = [separaAtributos objectForKey:@"descricaoTotalSolucao"];
        s.caminhoLink = [separaAtributos objectForKey:@"caminhoLink"];
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
        s.descricaoTotalSolucao = [separaAtributos objectForKey:@"descricaoTotalSolucao"];
        s.caminhoLink = [separaAtributos objectForKey:@"caminhoLink"];
        
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
        s.descricaoTotalSolucao = [separaAtributos objectForKey:@"descricaoTotalSolucao"];
        s.caminhoLink = [separaAtributos objectForKey:@"caminhoLink"];
        
        [listaSolucoesCurtidas addObject:s];
    }
    
    return listaSolucoesCurtidas;
}

- (NSInteger) retornaQuantidadeImplementacoes:(NSInteger)id_sol
{
    NSInteger retorno = 0;
    
    NSString *string = [NSString stringWithFormat:@"http://betovieira.com.br/handson/retornadados.php?tipo_operacao=14&id_solucao=%d",(int)id_sol];
    
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
        s.descricaoTotalSolucao = [separaAtributos objectForKey:@"descricaoTotalSolucao"];
        s.caminhoLink = [separaAtributos objectForKey:@"caminhoLink"];
        
        
        [listaImplementacoesPorSolucao addObject:s];
    }
    
    return listaImplementacoesPorSolucao;
}


@end
