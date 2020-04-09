#include <stdlib.h>
#include <time.h>
#include <iostream>
#include <QFile>
#include <QTextStream>

#include "plateau2048.h"

using namespace std;

Plateau2048::Plateau2048(QObject *parent) : QObject(parent)
{
    taille=4;
    score=0;
    initTable(0);
    loadScoreMax();
}

void Plateau2048::initTable(int valeur){
    for (int i=0;i<4;i++){
        for (int j=0;j<4;j++){
            table[i][j]=valeur;
        }
    }
    plateauChanged();
}

void Plateau2048::set(int x, int y, int value){
    table[x][y]=value;
    plateauChanged();
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

void Plateau2048::coup(int direction){// direction vaut 0,1,2 ou 3 selon le coup selectionné

    for (int n=0;n<4;n++){//on parcourt les lignes ou colonnes (selon la direction)

        int nouveau[4]; //nouvelle ligne (ou colonne) qui remplacera l'actuelle
        for (int x=0;x<4;x++){
            nouveau[x]=0;
        }

        int current=0;//pour savoir jusqu'a quelle case des nombres ont ete accumulés
        for (int k=0;k<4;k++){//on parcourt la ligne (ou colonne) en question
            int valeur;

            if (direction==0){//haut
                valeur=table[k][n];
            }
            if (direction==1){//bas
                valeur=table[4-k-1][n];
            }
            if (direction==2){//gauche
                valeur=table[n][k];
            }
            if (direction==3){//droite
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
            if (direction==0){//haut
                table[l][n]=nouveau[l];
            }
            if (direction==1){//bas
                table[4-l-1][n]=nouveau[l];
            }
            if (direction==2){//gauche
                table[n][l]=nouveau[l];
            }
            if (direction==3){//droite
                table[n][4-l-1]=nouveau[l];
            }
        }


    }

    plateauChanged();

    updateScore();

    if (restePlace()){
        ajout();
    }
    else{
        cout<<"Partie finie"<<endl<<flush;
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
    plateauChanged();
    updateScore();
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

QList<QString> Plateau2048::readPlateau(){
    QList<QString> liste = {};

    for (int i=0;i<4;i++){
        for (int j=0;j<4;j++){
            int valeur = table[i][j];
            if (valeur!=0){
                liste << QString::number(valeur);
            }
            else{
                liste << QString(); //string vide au lieu de 0
            }

        }
    }

    return liste;

}

void Plateau2048::loadScoreMax(){
    QFile file("meilleurScore.txt");
    file.open(QIODevice::ReadOnly | QIODevice::Text); //cree le fichier si il n'existe pas deja

    QTextStream in(&file);
    if (!in.atEnd()) {
        QString line = in.readLine();
        scoreMax=line.toInt();
    }
    else{
        scoreMax=0;
        saveScoreMax();
    }


}

void Plateau2048::saveScoreMax(){
    QFile file("meilleurScore.txt");
    if (!file.open(QIODevice::WriteOnly | QIODevice::Text)){
        cout << "Erreur lors de l'ouverture du fichier";
        return;
    }

    QTextStream out(&file);
    out << scoreMax;
}

void Plateau2048::updateScore(){
    int total=0;

    for (int i=0;i<4;i++){
        for (int j=0;j<4;j++){
            total += table[i][j];
        }
    }

    score = total;
    scoreChanged();

    if (score>scoreMax){
        scoreMax=score;
        saveScoreMax();
        scoreMaxChanged();
    }

}

void Plateau2048::reset(){
    initTable(0);
    ajout();
    updateScore();
}



