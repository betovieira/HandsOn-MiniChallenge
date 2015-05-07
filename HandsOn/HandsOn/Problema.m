//
//  Problema.m
//  HandsOn
//
//  Created by Pedro Lopes on 4/8/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import "Problema.h"

@implementation Problema


- (NSMutableArray *) retornaProblemasTodos
{
    NSMutableArray *listaProblemasTodos = [[NSMutableArray alloc] init];
    
    NSString *string = [NSString stringWithFormat:@"http://betovieira.com.br/handson/retornadados.php?tipo_operacao=4"];
    
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
        p.descricaoTotalProblema = [separaAtributos objectForKey:@"descricaoTotalProblema"];
        
        p.caminhoLink = [separaAtributos objectForKey:@"caminhoLink"];
        p.curtidasProblema = [[separaAtributos objectForKey:@"curtidasProblema"] intValue];
        
        [listaProblemasTodos addObject:p];
    }
    
    return listaProblemasTodos;
}

- (NSMutableArray *) retornaProblemasTodosAreaUltimos: (NSString *)strArea
{
    NSMutableArray *listaProblemasTodos = [[NSMutableArray alloc] init];
    
    NSString *string = [NSString stringWithFormat:@"http://betovieira.com.br/handson/retornadados.php?tipo_operacao=20&area=%@", strArea];
    
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
        p.descricaoTotalProblema = [separaAtributos objectForKey:@"descricaoTotalProblema"];
        p.caminhoLink = [separaAtributos objectForKey:@"caminhoLink"];
        p.curtidasProblema = [[separaAtributos objectForKey:@"curtidasProblema"] intValue];
        
        [listaProblemasTodos addObject:p];
    }
    
    return listaProblemasTodos;
}

- (int) retornaQuantidadeDeSolucoes: (int) id_problema
{
    //NSMutableArray *listaQuantidadeCurtidas = [[NSMutableArray alloc] init];
    
    NSString *string = [NSString stringWithFormat:@"http://betovieira.com.br/handson/retornadados.php?tipo_operacao=8&id_problema=%d", id_problema];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:string]];
    
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSArray *separaObjetos = [NSJSONSerialization JSONObjectWithData:response options:0 error:nil];
    
    NSDictionary *separaAtributos = [separaObjetos objectAtIndex:0];
    int retorno = [[separaAtributos objectForKey:@"retorno"] intValue];
    
    return retorno;
}


-(bool) cadastroProblema :(Problema *)p
{
    
    @try {
        NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://betovieira.com.br/handson/inseredados.php"]];
        
        [urlRequest setHTTPMethod:@"POST"];
        
        NSString *postString = [NSString stringWithFormat:@"tipo_operacao=2&id_usuario=%d&id_area=%d&descricaoProblema=%@&descricaoTotalProblema=%@&caminhoLink=%@", p.id_usuario, p.id_area, p.descricaoProblema, p.descricaoTotalProblema, p.caminhoLink];
        
        [urlRequest setValue:[NSString stringWithFormat:@"%lu", (unsigned long) [postString length]] forHTTPHeaderField:@"Content-length"];
        
        [urlRequest setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
        
        //NSURLConnection *c = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
        NSData *response = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:nil error:nil];
        NSArray *separaObjetos = [NSJSONSerialization JSONObjectWithData:response options:0 error:nil];
        NSDictionary *separaAtributos = [separaObjetos objectAtIndex:0];
        
        NSString *retorno = [separaAtributos objectForKey:@"retorno"];
        
        NSLog(@"D: %@", retorno);
        
        return [[separaAtributos objectForKey:@"retorno"] boolValue];
        
    }
    @catch(NSException *e)
    {
        return false;
    }
    
}




/*USANDO*/

- (NSMutableArray *) retornaProblemasArea: (Area *)a
{
    NSMutableArray *listaProblemasArea = [[NSMutableArray alloc] init];
    
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
        
        [listaProblemasArea addObject:p];
    }
    
    return listaProblemasArea;
}



- (NSMutableArray *) retornaProblemasCurtidos
{
    NSMutableArray *listaProblemasCurtidos = [[NSMutableArray alloc] init];
    
    NSString *string = [NSString stringWithFormat:@"http://betovieira.com.br/handson/retornadados.php?tipo_operacao=7"];
    
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
        
        [listaProblemasCurtidos addObject:p];
    }
    
    return listaProblemasCurtidos;
}



-(NSMutableArray *) retornaSolucoesPorProblema:(Problema *)r;
{
    NSMutableArray *listaTodasSolucoes = [[NSMutableArray alloc] init];
    
    NSString *string = [NSString stringWithFormat:@"http://betovieira.com.br/handson/retornadados.php?tipo_operacao=8&id_problema=%d", r.id_problema];
    
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
        
        [listaTodasSolucoes addObject:p];
    }
    
    return listaTodasSolucoes;
}

@end
