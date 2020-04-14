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

    void initTable(int valeur);
    void set(int x, int y, int value);
    Q_INVOKABLE void coup(int direction); //joue un coup dans une des 4 directions
    Q_INVOKABLE void ajout(); //ajoute un nombre aléatoirement
    Q_INVOKABLE void redimension(); //redimensionnement
    Q_INVOKABLE void redimension2(); //redimensionnement
    bool restePlace(); //permet de savoir si il reste au moins 1 case libre (c'est à dire au moins un 0 dans table)
    bool coupPossible(); //pour savoir si il y a encore au moins 1 coup possible

    QList<QString> readPlateau();

    QString readScore() {
     return QString::number(score);
    }

    QString readScoreMax() {
     return QString::number(scoreMax);
    }

    QString readFinie() {
        QString str;
        if (finie==false){
            str = "Partie en cours";
        }
        else{
            str = "Partie finie";
        }
        return str;
    }

    Q_PROPERTY(QString score READ readScore NOTIFY scoreChanged)
    Q_PROPERTY(QString scoreMax READ readScoreMax NOTIFY scoreMaxChanged)
    Q_PROPERTY(QString partieFinie READ readFinie NOTIFY finieChanged)
    Q_PROPERTY(QList<QString> listePlateau READ readPlateau NOTIFY plateauChanged)

    void loadScoreMax();
    void saveScoreMax();
    void updateScore();

    Q_INVOKABLE void reset();

private:

    int taille;
    int table[5][5];
    int score;
    int scoreMax;
    bool finie;




signals:

    void plateauChanged();
    void scoreChanged();
    void scoreMaxChanged();
    void finieChanged();
};

#endif // PLATEAU2048_H
