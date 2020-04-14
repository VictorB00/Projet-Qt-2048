#include <stdlib.h>
#include <time.h>
#include <iostream>
#include <QFile>
#include <QTextStream>

#include "plateau2048.h"

using namespace std;

Plateau2048::Plateau2048(QObject *parent) : QObject(parent)
{

    taille = 4;
    finie = false;
    finieChanged();
    score=0;
    initTable(0);
    loadScoreMax();
}

void Plateau2048:: redimension(){

    taille = 5;
    plateauChanged();

}

void Plateau2048:: redimension2(){

    taille = 4;
    plateauChanged();

}

void Plateau2048::initTable(int valeur){
    if(valeur < 0){
        throw("Erreur : valeur négative");
    }

    for (int i=0;i<taille;i++){
        for (int j=0;j<taille;j++){
            table[i][j]=valeur;
        }
    }
    plateauChanged();
}

void Plateau2048::set(int x, int y, int value){
    if (x<0 || x>=taille){
        throw ("Premier indice pas dans le bon domaine");
    }
    if (y<0 || y>=taille){
        throw ("Deuxième indice pas dans le bon domaine");
    }
    if(value < 0){
        throw("Erreur : valeur négative");
    }

    table[x][y]=value;
    plateauChanged();
}

ostream& operator<<(ostream& out, Plateau2048& plateau){
    out << "Plateau de jeu :" << endl;
    for (int i=0;i<plateau.taille;i++){
        for (int j=0;j<plateau.taille;j++){
            out << plateau.table[i][j] << " ";
        }
        out << endl;
    }

    return out;
}

void Plateau2048::coup(int direction){// direction vaut 0,1,2 ou 3 selon le coup selectionné

    if (!(direction==0 || direction==1 || direction==2 || direction==3)){
        throw("Problème sur la valeur de l'argument indiquant la direction");
    }

    if(!finie){
        for (int n=0;n<taille;n++){//on parcourt les lignes ou colonnes (selon la direction)

            int nouveau[taille]; //nouvelle ligne (ou colonne) qui remplacera l'actuelle
            for (int x=0;x<taille;x++){
                nouveau[x]=0;
            }

            int current=0;//pour savoir jusqu'a quelle case des nombres ont ete accumulés
            for (int k=0;k<taille;k++){//on parcourt la ligne (ou colonne) en question
                int valeur;

                if (direction==0){//haut
                    valeur=table[k][n];
                }
                if (direction==1){//bas
                    valeur=table[taille-k-1][n];
                }
                if (direction==2){//gauche
                    valeur=table[n][k];
                }
                if (direction==3){//droite
                    valeur=table[n][taille-k-1];
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

            for (int l=0;l<taille;l++){//puis on met a jour la ligne (ou colonne) de table a partir de nouveau
                if (direction==0){//haut
                    table[l][n]=nouveau[l];
                }
                if (direction==1){//bas
                    table[taille-l-1][n]=nouveau[l];
                }
                if (direction==2){//gauche
                    table[n][l]=nouveau[l];
                }
                if (direction==3){//droite
                    table[n][taille-l-1]=nouveau[l];
                }
            }


        }

        plateauChanged();

        updateScore();

        if (restePlace()){
            ajout();
        }
        if(!coupPossible()){
            finie=true;
            finieChanged();
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

        int x=rand()%taille;
        int y=rand()%taille;
        while(table[x][y]!=0){
            x=rand()%taille;
            y=rand()%taille
                    ;
        }
        table[x][y]=newValeur;

    }
    plateauChanged();
    updateScore();
}

bool Plateau2048::restePlace(){
    bool reste=false;
    for (int i=0;i<taille;i++){
        for (int j=0;j<taille;j++){
            if(table[i][j]==0){
                reste=true;
                break;
            }
        }
    }
    return reste;
}

bool Plateau2048::coupPossible(){//revient a verifier qu'il y a une case vide ou qu'il y a 2 cases cotes a cote du meme nombre
    if (restePlace()){
        return true;
    }

    for (int i1=0;i1<taille;i1++){
        for (int j1=0;j1<taille;j1++){
            int valeur1= table[i1][j1];

            for (int i2=i1-1;i2<=i1+1;i2+=2){
                if (i2>=0 && i2<taille){
                    int valeur2=table[i2][j1];
                    if (valeur1==valeur2){
                        return true;
                    }
                }
            }

            for (int j2=j1-1;j2<=j1+1;j2+=2){
                if (j2>=0 && j2<taille){
                    int valeur2=table[i1][j2];
                    if (valeur1==valeur2){
                        return true;
                    }
                }
            }

        }
    }
    return false;

}

QList<QString> Plateau2048::readPlateau(){
    QList<QString> liste = {};

    for (int i=0;i<taille;i++){
        for (int j=0;j<taille;j++){
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
        throw("Erreur lors de l'ouverture du fichier");
        return;
    }

    QTextStream out(&file);
    out << scoreMax;
}

void Plateau2048::updateScore(){
    int total=0;

    for (int i=0;i<taille;i++){
        for (int j=0;j<taille;j++){
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
    finie=false;
    finieChanged();
}



