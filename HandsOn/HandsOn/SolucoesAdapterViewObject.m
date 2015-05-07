//
//  SolucoesAdapterViewObject.m
//  HandsOn
//
//  Created by Humberto Vieira de Castro on 4/17/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import "SolucoesAdapterViewObject.h"
#import "BancoDadosHelper.h"

@implementation SolucoesAdapterViewObject


- (NSMutableArray *) retornaTodosSolucoesAdaptadosAreaUltimos: (NSString *)strArea
{
    NSMutableArray *listaSolucao = [[NSMutableArray alloc] init];
    @try {
        NSString *string = [NSString stringWithFormat:@"http://betovieira.com.br/handson/retornadados.php?tipo_operacao=23&area=%@", strArea];
        
        NSArray *separaObjetos = [BancoDadosHelper retornaDados:string];
        
        NSDictionary *separaAtributos;
        
        for (int i = 0; i < separaObjetos.count; i++) {
            separaAtributos = [separaObjetos objectAtIndex:i];
            
            SolucoesAdapterViewObject *s = [[SolucoesAdapterViewObject alloc] init];
            s.id_solucao = [[separaAtributos objectForKey:@"id_solucao"] intValue];
            s.id_usuario = [[separaAtributos objectForKey:@"id_usuario"] intValue];
            s.curtidasSolucao = [[separaAtributos objectForKey:@"curtidasSolucao"] intValue] ;
            s.nomeArea = [separaAtributos objectForKey:@"nomeArea"];
            s.descricaoSolucao = [separaAtributos objectForKey:@"descricaoSolucao"];
            s.interesse = [separaAtributos objectForKey:@"interesse"] ;
            s.quantidadeImplementacoes = [[separaAtributos objectForKey:@"quantidadeImplementacoes"] intValue];
            
            [listaSolucao addObject:s];
        }
        
        return listaSolucao;
    }@catch (NSException *e){
        NSLog(@"%@", e);
        return nil;
    }
    
}

- (NSMutableArray *) retornaSolucaoAdaptadosTodos
{
    NSMutableArray *listaSolucao = [[NSMutableArray alloc] init];
    
        NSString *string = [NSString stringWithFormat:@"http://betovieira.com.br/handson/retornadados.php?tipo_operacao=24"];
        
        NSArray *separaObjetos = [BancoDadosHelper retornaDados:string];
        
        NSDictionary *separaAtributos;
        
        for (int i = 0; i < separaObjetos.count; i++) {
            separaAtributos = [separaObjetos objectAtIndex:i];
            
            SolucoesAdapterViewObject *s = [[SolucoesAdapterViewObject alloc] init];
            s.id_solucao = [[separaAtributos objectForKey:@"id_solucao"] intValue];
            s.id_usuario = [[separaAtributos objectForKey:@"id_usuario"] intValue];
            s.curtidasSolucao = [[separaAtributos objectForKey:@"curtidasSolucao"] intValue] ;
            s.nomeArea = [separaAtributos objectForKey:@"nomeArea"];
            s.descricaoSolucao = [separaAtributos objectForKey:@"descricaoSolucao"];
            s.interesse = [separaAtributos objectForKey:@"interesse"] ;
            s.quantidadeImplementacoes = [[separaAtributos objectForKey:@"quantidadeImplementacoes"] intValue];
            
            [listaSolucao addObject:s];
        }
        
        return listaSolucao;
    
    
    
    
}

- (NSMutableArray *) retornaTodosSolucoesAdaptadosAreaCurtida: (NSString *)strArea
{
    NSMutableArray *listaSolucao = [[NSMutableArray alloc] init];
    
    @try {
        NSString *string = [NSString stringWithFormat:@"http://betovieira.com.br/handson/retornadados.php?tipo_operacao=25&area=%@", strArea];
        
        NSArray *separaObjetos = [BancoDadosHelper retornaDados:string];
        
        NSDictionary *separaAtributos;
        
        for (int i = 0; i < separaObjetos.count; i++) {
            separaAtributos = [separaObjetos objectAtIndex:i];
            
            SolucoesAdapterViewObject *s = [[SolucoesAdapterViewObject alloc] init];
            s.id_solucao = [[separaAtributos objectForKey:@"id_solucao"] intValue];
            s.id_usuario = [[separaAtributos objectForKey:@"id_usuario"] intValue];
            s.curtidasSolucao = [[separaAtributos objectForKey:@"curtidasSolucao"] intValue] ;
            s.nomeArea = [separaAtributos objectForKey:@"nomeArea"];
            s.descricaoSolucao = [separaAtributos objectForKey:@"descricaoSolucao"];
            s.interesse = [separaAtributos objectForKey:@"interesse"] ;
            s.quantidadeImplementacoes = [[separaAtributos objectForKey:@"quantidadeImplementacoes"] intValue];
            
            [listaSolucao addObject:s];
        }
        
        return listaSolucao;
    }@catch (NSException *e){
        NSLog(@"%@", e);
        return nil;
    }
    
}

- (NSMutableArray *) retornaSolucoesAdaptadosTodosPorCurtida
{
    NSMutableArray *listaSolucao = [[NSMutableArray alloc] init];
    
    @try {
        NSString *string = [NSString stringWithFormat:@"http://betovieira.com.br/handson/retornadados.php?tipo_operacao=26"];
        
        NSArray *separaObjetos = [BancoDadosHelper retornaDados:string];
        
        NSDictionary *separaAtributos;
        
        for (int i = 0; i < separaObjetos.count; i++) {
            separaAtributos = [separaObjetos objectAtIndex:i];
            
            SolucoesAdapterViewObject *s = [[SolucoesAdapterViewObject alloc] init];
            s.id_solucao = [[separaAtributos objectForKey:@"id_solucao"] intValue];
            s.id_usuario = [[separaAtributos objectForKey:@"id_usuario"] intValue];
            s.curtidasSolucao = [[separaAtributos objectForKey:@"curtidasSolucao"] intValue] ;
            s.nomeArea = [separaAtributos objectForKey:@"nomeArea"];
            s.descricaoSolucao = [separaAtributos objectForKey:@"descricaoSolucao"];
            s.interesse = [separaAtributos objectForKey:@"interesse"] ;
            s.quantidadeImplementacoes = [[separaAtributos objectForKey:@"quantidadeImplementacoes"] intValue];
            
            [listaSolucao addObject:s];
        }
        
        return listaSolucao;
        
    }@catch (NSException *e){
        NSLog(@"%@", e);
        return nil;
    }
}




- (NSMutableArray *) retornaTodosSolucoesPorProblema: (int) id_problema
{
    NSMutableArray *listaSolucao = [[NSMutableArray alloc] init];
    
    @try {
        NSString *string = [NSString stringWithFormat:@"http://betovieira.com.br/handson/retornadados.php?tipo_operacao=9&id_problema=%d", id_problema];
        
        NSArray *separaObjetos = [BancoDadosHelper retornaDados:string];
        
        NSDictionary *separaAtributos;
        
        for (int i = 0; i < separaObjetos.count; i++) {
            separaAtributos = [separaObjetos objectAtIndex:i];
            
            SolucoesAdapterViewObject *s = [[SolucoesAdapterViewObject alloc] init];
            s.id_solucao = [[separaAtributos objectForKey:@"id_solucao"] intValue];
            s.id_usuario = [[separaAtributos objectForKey:@"id_usuario"] intValue];
            s.curtidasSolucao = [[separaAtributos objectForKey:@"curtidasSolucao"] intValue] ;
            
            s.nomeArea = [separaAtributos objectForKey:@"nomeArea"];
            s.nomeArea = [separaAtributos objectForKey:@"id_area"];
            
            
            s.descricaoSolucao = [separaAtributos objectForKey:@"descricaoSolucao"];
            s.interesse = [separaAtributos objectForKey:@"interesse"] ;
            
            s.caminhoAnexoSolucao = [separaAtributos objectForKey:@"caminhoAnexoSolucao"];
            s.descricaoTotalSolucao = [separaAtributos objectForKey:@"descricaoTotalSolucao"];
            s.caminhoLink = [separaAtributos objectForKey:@"caminhoLink"];
            
            NSLog(@"eta %@", s.descricaoSolucao);
            
            [listaSolucao addObject:s];
        }
        
        return listaSolucao;
    }@catch (NSException *e){
        NSLog(@"Erro banco: %@", e);
        return nil;
    }
    
}



@end
