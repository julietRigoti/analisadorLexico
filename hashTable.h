#ifndef HASHTABLE_H
#define HASHTABLE_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define TAM 53 // para tabela hash
#define MAX 30 // para vetor de char

typedef struct HashEntry{
    char name[MAX];
    int type;
    int lineno;
    struct HashEntry *prox;
} HashEntry;

typedef struct HashEntry tab[MAX];

//Inicializa a tabela hash com NULL
//Entrada: tabela hash 
//pre-condicao: nenhuma
//pos-condicao: nenhuma
void initialization(HashEntry *H[]);

//Inserir um elemento na tabela hash
//Entrada: tabela hash, nome do token, len do tamanho da palavra, type que é o tipo do token, line é o numero da linha das fontes 
//pre-condicao: nenhuma
//pos-condicao: elemento é inserido na tabela hash
void inserts(HashEntry *H[], char *name, int len, int type, int line);

#endif