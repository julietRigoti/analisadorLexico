%{
	/*1°)Definições */
#include "hashTable.c"

int flag = 1;
HashEntry *H[TAM];
extern FILE *yyin;

%}

/*Operadores aritmeticos*/
sub "-"
sum "+"
mult "*"
div "/"
pow "**"
mod "%"

/*Incremento e decremento/*
incr "++"
decr "--"

/*Atribuição*/      
assignment "="

/*Operadores de comparação*/
comparator  ("<"|">"|"<="|">="|"!="|"==")

/*Operadores Logicos*/
and "&&"
or "||"
not  ("~"|"!")


o_key "{"
c_key "}"
o_brac  "/["
c_brac  "/]"
o_par "("
c_par ")"
two_point ":"
semicolon ";"
comma ","
point "."
EOF =   '\0'

letter  [a-zA-z]
string  (\".*\")
number  [0-9]
id      {letter}({letter}|{number})*

%%

{string} {
	printf("Token: String -> %s\n",yytext);
	inserts(H, yytext, strlen(yytext), 0, flag);
}
(while) {
	printf("Token: Palavra reservada -> %s\n",yytext);
	inserts(H, yytext, strlen(yytext), 0, flag);
}
(for) {
	printf("Token: Palavra reservada -> %s\n",yytext);
	inserts(H, yytext, strlen(yytext), 0, flag);
}
(if) {
	printf("Token: Palavra reservada -> %s\n",yytext);
	inserts(H, yytext, strlen(yytext), 0, flag);
}
(char|int|void|float|double) {
	printf("Token: Palavra reservada -> %s\n",yytext);
	inserts(H, yytext, strlen(yytext), 0, flag);
}
{id} {
	if(strlen(yytext) > 20){
		printf("ERRO: Tamanho maximo de identificador (20) excedido!\n");
		inserts(H, yytext, strlen(yytext), 0, flag);
	}
	else{
		printf("Token: Identificador \"%s\"\n",yytext);
		inserts(H, yytext, strlen(yytext), 0, flag);
    }
}
{number} {
	printf("Token: Digito\n");
	inserts(H, yytext, strlen(yytext), 0, flag);
}
{sum} {
	printf("Token: Operador de soma\n");
	inserts(H, yytext, strlen(yytext), 0, flag);
}
{sub} {
	printf("Token: Operador de subtracao\n");
	inserts(H, yytext, strlen(yytext), 0, flag);
}
{mult} {
	printf("Token: Operador de multiplicacao\n");
	inserts(H, yytext, strlen(yytext), 0, flag);
}
{div} {
	printf("Token: Operador de divisao\n");
	inserts(H, yytext, strlen(yytext), 0, flag);
}
{and} {
	printf("Token: Operador Logico AND\n");
	inserts(H, yytext, strlen(yytext), 0, flag);
}
{or} {
	printf("Token: Operador Logico OR\n");
	inserts(H, yytext, strlen(yytext), 0, flag);
}
{not} {
	printf("Token: Operador Logico NOT\n");
	inserts(H, yytext, strlen(yytext), 0, flag);
}
{o_key} {
	printf("Token: Abre Chaves\n");
	inserts(H, yytext, strlen(yytext), 0, flag);
}
{o_brac} {
	printf("Token: Abre Colchetes\n");
	inserts(H, yytext, strlen(yytext), 0, flag);
}
{o_par} {
	printf("Token: Abre Parenteses\n");
	inserts(H, yytext, strlen(yytext), 0, flag);
}
{c_par} {
	printf("Token: Fecha Parenteses\n");
	inserts(H, yytext, strlen(yytext), 0, flag);
}
{c_brac} {
	printf("Token: Fecha Colchetes\n");
	inserts(H, yytext, strlen(yytext), 0, flag);
}
{c_key} {
	printf("Token: Fecha Chaves\n");
	inserts(H, yytext, strlen(yytext), 0, flag);
}
{comparator} {
	printf("Token: Comparacao\n");
	inserts(H, yytext, strlen(yytext), 0, flag);
}
{assignment} {
	printf("Token: Atribuicao\n");
	inserts(H, yytext, strlen(yytext), 0, flag);
}
{semicolon} {
	printf("Token: Ponto-Virgula\n");
	inserts(H, yytext, strlen(yytext), 0, flag);
}
{comma} {
	printf("Token: Virgula\n");
	inserts(H, yytext, strlen(yytext), 0, flag);
}
{number}("$"|"@"|{letter}|{number})+  {
		printf("ERRO ID: Token [%s] nao identificado na linha: %d\n", yytext, flag);
		inserts(H, yytext, strlen(yytext), 0, flag);
}
{letter}("$"|"@"|{letter}|{number})+  {
		printf("ERRO ID: Token [%s] nao identificado na linha: %d\n", yytext, flag);
		inserts(H, yytext, strlen(yytext), 0, flag);
}

"\n" {flag++;}
[ \t\r\f]+
. {
	printf("Token [%s] nao identificado na linha: %d\n", yytext, flag);
	inserts(H, yytext, strlen(yytext), 0, flag);
}

%%

int yywrap(){ return 1;}

int main(){

	int i;
    char str[MAX];
    initialization(H);

	printf("Deseja entrar com um arquivo? 1-sim/2-nao\n");
	scanf("%d", &i);

	while(i == 1){
		flag = 1;
		printf("Entre com um arquivo.txt\n");
    	scanf("%s", str);
    	yyin = fopen(str,"r");
		printf("\n");
		if(yyin != NULL){
        	yylex();
       		fclose(yyin);
			} else printf("Arquivo não encontrado\n");
		
		printf("Deseja entrar com um arquivo? 1-sim/2-nao\n");
		scanf("%d", &i);
	}
    return 0;
}