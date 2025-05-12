%{
#include <stdio.h>
#include <string.h>

// Helper function to compare case-insensitively
int match(const char* word, const char* list[]) {
    for (int i = 0; list[i]; i++) {
        if (strcasecmp(word, list[i]) == 0)
            return 1;
    }
    return 0;
}

// Predefined POS keyword lists
const char* nouns[] = {"destiny", "man", "woman", "world", NULL};
const char* verbs[] = {"run", "dread", "arrives", "go", "come", NULL};
const char* pronouns[] = {"he", "she", "it", "they", "we", "i", "you", NULL};
const char* prepositions[] = {"from", "to", "on", "in", "at", "by", NULL};
const char* determiners[] = {"the", "a", "an", "all", NULL};
const char* adjectives[] = {"same", "big", "small", "great", NULL};

%}

%%

[a-zA-Z]+ {
    if (match(yytext, nouns))        printf("Noun: %s\n", yytext);
    else if (match(yytext, verbs))   printf("Verb: %s\n", yytext);
    else if (match(yytext, pronouns))printf("Pronoun: %s\n", yytext);
    else if (match(yytext, prepositions)) printf("Preposition: %s\n", yytext);
    else if (match(yytext, determiners))  printf("Determiner: %s\n", yytext);
    else if (match(yytext, adjectives))   printf("Adjective: %s\n", yytext);
    else                              printf("Unknown Word: %s\n", yytext);
}

[.!?]        { printf("Punctuation: %s\n", yytext); }
[ \t\n]+     { /* Ignore whitespace */ }
.            { printf("Unknown Symbol: %s\n", yytext); }

%%

int main() {
    printf("Enter your text (Ctrl+D to end):\n");
    yylex();
    return 0;
}


