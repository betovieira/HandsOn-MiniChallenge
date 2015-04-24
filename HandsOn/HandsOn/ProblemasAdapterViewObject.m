//
//  ProblemasAdapterViewObject.m
//  HandsOn
//
//  Created by Humberto Vieira de Castro on 4/16/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import "ProblemasAdapterViewObject.h"
#import "BancoDadosHelper.h"

@implementation ProblemasAdapterViewObject

- (NSMutableArray *) retornaTodosProblemasAdaptadosAreaUltimos: (NSString *)strArea
{
    NSMutableArray *listaProblemas = [[NSMutableArray alloc] init];
    @try {
        NSString *string = [NSString stringWithFormat:@"http://betovieira.com.br/handson/retornadados.php?tipo_operacao=19&area=%@", strArea];
        
        NSArray *separaObjetos = [BancoDadosHelper retornaDados:string];
        
        NSDictionary *separaAtributos;
        
        for (int i = 0; i < separaObjetos.count; i++) {
            separaAtributos = [separaObjetos objectAtIndex:i];
            
            ProblemasAdapterViewObject *p = [[ProblemasAdapterViewObject alloc] init];
            p.id_problema = [[separaAtributos objectForKey:@"id_problema"] intValue];
            p.nomeArea = [separaAtributos objectForKey:@"nomeArea"];
            p.descricaoProblema = [separaAtributos objectForKey:@"descricaoProblema"];
            p.nome_usuario = [separaAtributos objectForKey:@"nome_usuario"];
            p.descricaoTotalProblema = [separaAtributos objectForKey:@"descricaoTotalProblema"];
            p.caminhoLink = [separaAtributos objectForKey:@"caminhoLink"];
            p.curtidasProblema = [[separaAtributos objectForKey:@"curtidasProblema"] intValue];
            
            [listaProblemas addObject:p];
        }
        
        return listaProblemas;
    }@catch (NSException *e){
        NSLog(@"%@", e);
        return nil;
    }
    
}

- (NSMutableArray *) retornaProblemasAdaptadosTodos
{
    NSMutableArray *listaProblemas = [[NSMutableArray alloc] init];
    @try {
        NSString *string = [NSString stringWithFormat:@"http://betovieira.com.br/handson/retornadados.php?tipo_operacao=20"];
        
        NSArray *separaObjetos = [BancoDadosHelper retornaDados:string];
        
        NSDictionary *separaAtributos;
        
        for (int i = 0; i < separaObjetos.count; i++) {
            separaAtributos = [separaObjetos objectAtIndex:i];
            
            ProblemasAdapterViewObject *p = [[ProblemasAdapterViewObject alloc] init];
            p.id_problema = [[separaAtributos objectForKey:@"id_problema"] intValue];
            p.nomeArea = [separaAtributos objectForKey:@"nomeArea"];
            p.descricaoProblema = [separaAtributos objectForKey:@"descricaoProblema"];
            p.nome_usuario = [separaAtributos objectForKey:@"nome_usuario"];
            p.descricaoTotalProblema = [separaAtributos objectForKey:@"descricaoTotalProblema"];
            p.caminhoLink = [separaAtributos objectForKey:@"caminhoLink"];
            p.curtidasProblema = [[separaAtributos objectForKey:@"curtidasProblema"] intValue];
            
            [listaProblemas addObject:p];
        }
        
        return listaProblemas;
    }@catch (NSException *e){
        NSLog(@"%@", e);
        return nil;
    }
}

- (NSMutableArray *) retornaTodosProblemasAdaptadosAreaCurtida: (NSString *)strArea
{
    NSMutableArray *listaProblemas = [[NSMutableArray alloc] init];
  
    @try {
        NSString *string = [NSString stringWithFormat:@"http://betovieira.com.br/handson/retornadados.php?tipo_operacao=21&area=%@", strArea];
        
        NSArray *separaObjetos = [BancoDadosHelper retornaDados:string];
        
        NSDictionary *separaAtributos;
        
        for (int i = 0; i < separaObjetos.count; i++) {
            separaAtributos = [separaObjetos objectAtIndex:i];
            
            ProblemasAdapterViewObject *p = [[ProblemasAdapterViewObject alloc] init];
            p.id_problema = [[separaAtributos objectForKey:@"id_problema"] intValue];
            p.nomeArea = [separaAtributos objectForKey:@"nomeArea"];
            p.descricaoProblema = [separaAtributos objectForKey:@"descricaoProblema"] ;
            p.nome_usuario = [separaAtributos objectForKey:@"nome_usuario"];
            p.descricaoTotalProblema = [separaAtributos objectForKey:@"descricaoTotalProblema"];
            p.caminhoLink = [separaAtributos objectForKey:@"caminhoLink"];
            p.curtidasProblema = [[separaAtributos objectForKey:@"curtidasProblema"] intValue];
            
            [listaProblemas addObject:p];
        }
        
        return listaProblemas;
    }@catch (NSException *e){
        NSLog(@"%@", e);
        return nil;
    }
    
}

- (NSMutableArray *) retornaProblemasAdaptadosTodosPorCurtida
{
    NSMutableArray *listaProblemas = [[NSMutableArray alloc] init];
    
    @try {
        NSString *string = [NSString stringWithFormat:@"http://betovieira.com.br/handson/retornadados.php?tipo_operacao=22"];
        
        NSArray *separaObjetos = [BancoDadosHelper retornaDados:string];
        
        NSDictionary *separaAtributos;
        
        for (int i = 0; i < separaObjetos.count; i++) {
            separaAtributos = [separaObjetos objectAtIndex:i];
            
            ProblemasAdapterViewObject *p = [[ProblemasAdapterViewObject alloc] init];
            p.id_problema = [[separaAtributos objectForKey:@"id_problema"] intValue];
            p.nomeArea = [separaAtributos objectForKey:@"nomeArea"];
            p.descricaoProblema = [separaAtributos objectForKey:@"descricaoProblema"] ;
            p.nome_usuario = [separaAtributos objectForKey:@"nome_usuario"];
            p.descricaoTotalProblema = [separaAtributos objectForKey:@"descricaoTotalProblema"];
            p.caminhoLink = [separaAtributos objectForKey:@"caminhoLink"];
            p.curtidasProblema = [[separaAtributos objectForKey:@"curtidasProblema"] intValue];
            
            [listaProblemas addObject:p];
        }
        
        return listaProblemas;
        
    }@catch (NSException *e){
        NSLog(@"%@", e);
        return nil;
    }
}




@end
