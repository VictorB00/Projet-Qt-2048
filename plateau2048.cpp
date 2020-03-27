#include <stdlib.h>
#include <time.h>

#include "plateau2048.h"

Plateau2048::Plateau2048(QObject *parent) : QObject(parent)
{
    taille=4;

    for (int i=0;i<4;i++){
        for (int j=0;j<4;j++){
            table[i][j]=0;
        }
    }
}

void Plateau2048::set(int x, int y, int value){
    table[x][y]=value;
}

ostream& operator<<(ostream& out, Plateau2048& plateau){
    out << "Plateau de jeu :" << endl;

    for (int i=0;i<4;i++){
        for (int j=0;j<4;j++){
            out << plateau.table[i][j] << " ";
        }
        out << endl;
    }

    return out;
}

void Plateau2048::coup(char direction){// direction vaut 'z','q','s' ou 'd' selon le coup selectionné

    for (int n=0;n<4;n++){//on parcourt les lignes ou colonnes (selon la direction)

        int nouveau[4]; //nouvelle ligne (ou colonne) qui remplacera l'actuelle
        for (int x=0;x<4;x++){
            nouveau[x]=0;
        }

        int current=0;//pour savoir jusqu'a quelle case des nombres ont ete accumulés
        for (int k=0;k<4;k++){//on parcourt la ligne (ou colonne) en question
            int valeur;

            if (direction=='z'){//haut
                valeur=table[k][n];
            }
            if (direction=='s'){//bas
                valeur=table[4-k-1][n];
            }
            if (direction=='q'){//gauche
                valeur=table[n][k];
            }
            if (direction=='d'){//droite
                valeur=table[n][4-k-1];
            }

            if (valeur!=0){//si la case contient un nombre
                if (current>0 && nouveau[current-1]==valeur){//on vérifie si il peut fusionner avec le précédent
                    if (current>1 && nouveau[current-2]==2*valeur){//si la fusion est possible on vérifie si le résultat de la fusion peut lui-même fusionner
                        nouveau[current-2]=4*valeur;
                        nouveau[current-1]=0;
                        current--;
                    }
                    else{
                        nouveau[current-1]=2*valeur;
                    }
                }
                else{
                    nouveau[current]=valeur;
                    current++;
                }
            }
        }

        for (int l=0;l<4;l++){//puis on met a jour la ligne (ou colonne) de table a partir de nouveau
            if (direction=='z'){//haut
                table[l][n]=nouveau[l];
            }
            if (direction=='s'){//bas
                table[4-l-1][n]=nouveau[l];
            }
            if (direction=='q'){//gauche
                table[n][l]=nouveau[l];
            }
            if (direction=='d'){//droite
                table[n][4-l-1]=nouveau[l];
            }
        }


    }

}

void Plateau2048::ajout(){
    if (restePlace()){//on vérifie qu'il y a une place vide

        srand (time(NULL));

        int proba=rand()%10;
        int newValeur;
        if (proba==9){//1 chance sur 10
            newValeur=4;
        }
        else{
            newValeur=2;
        }

        int x=rand()%4;
        int y=rand()%4;
        while(table[x][y]!=0){
            x=rand()%4;
            y=rand()%4;
        }
        table[x][y]=newValeur;

    }
}

bool Plateau2048::restePlace(){
    bool reste=false;
    for (int i=0;i<4;i++){
        for (int j=0;j<4;j++){
            if(table[i][j]==0){
                reste=true;
                break;
            }
        }
    }
    return reste;
}
