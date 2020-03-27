#ifndef PLATEAU2048_H
#define PLATEAU2048_H


#include <QObject>

#include <iostream>
using namespace std;

class Plateau2048 : public QObject
{
    Q_OBJECT
public:
    explicit Plateau2048(QObject *parent = nullptr);

    friend ostream& operator<< (ostream& , Plateau2048&);

    void set(int x, int y, int value);

    void coup(char direction); //joue un coup dans une des 4 directions

    void ajout(); //ajoute un nombre aléatoirement

    bool restePlace(); //permet de savoir si il reste au moins 1 case libre (c'est à dire au moins un 0 dans table)

private:

    int taille;
    int table[4][4];
signals:

};

#endif // PLATEAU2048_H
