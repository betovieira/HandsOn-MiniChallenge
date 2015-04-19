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
    @try {
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
            
            [listaSolucao addObject:s];
        }
        
        return listaSolucao;
    }@catch (NSException *e){
        NSLog(@"%@", e);
        return nil;
    }
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
            
            [listaSolucao addObject:s];
        }
        
        return listaSolucao;
        
    }@catch (NSException *e){
        NSLog(@"%@", e);
        return nil;
    }
}


@end
