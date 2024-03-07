#include <iostream>
#include <cctype>
#include <iomanip>
using namespace std;

float VI, VF, POR;

int valorizacao (void);
int ganhos (void);
int simulacao (void);
int pausa (void);

int main (void)
{
    cout << "Entre com o valor inicial da ação: "; cin >> VI;
    cout << "Entre com o valor atual da acao..: "; cin >> VF;
    valorizacao();
    cout << "Deseja simular ganhos: sim (S) - não (N)";

    ganhos ();
    simulacao ();
    pausa();
}

int valorizacao (void)
{
    POR = (VF*100)/VI-100;

    cout << endl;
    cout << "A açao teve uma valorizaçao de.....: " << POR << "%";
    cout << endl;
    cout << endl;
    return 0;
}

int ganhos (void)
{
    float VAC, TOTAL;

    cout << "Caso queira escolha um valor a simular" << endl;
    cout << "--------------------------------------" << endl;
    cout << endl;

    cout << "O calculo sera baseado na % encontrada de: " << POR << "%";
    cout << endl;
    cout << "Entre com o valor de ações compradas: "; cin >> VAC;

    TOTAL = (POR/100)*VAC;

    cout << "Os ganhos foram de: " << TOTAL;
    cout << endl;
    cout << "Total = "; cout << VAC + TOTAL;
    cout << endl;
    cout << endl;
    return 0;
}

int simulacao (void)
{
    float POR, DEZ, CINQUE, DUZE, MEIO;

    cout << "Simulação de ganhos para 10 mil - 50 mil - 200mil - 500mil";
    cout << endl;
    cout << endl;

    cout << "Entre com a porcentagem de valorização da ação: "; cin >> POR;
    cout << endl;
    cout << endl;
    cout << "------------------------------------------------------";
    cout << endl;
    cout << endl;

    DEZ = (POR/100)*10000+10000;
    CINQUE = (POR/100)*50000+50000;
    DUZE = (POR/100)*200000+200000;
    MEIO = (POR/100)*500000+500000;


    cout << "Para R$ 10 mil investido....: "; cout << DEZ-10000 ;
    cout << endl;
    cout << "Para R$ 50 mil investido....: "; cout << CINQUE-50000 ;
    cout << endl;
    cout << "Para R$ 200 mil investido...: "; cout << DUZE-200000 ;
    cout << endl;
    cout << "Para R$ 500 mil investido...: "; cout << MEIO-500000 ;
    cout << endl;
    cout << endl;
    return 0;
}

int pausa (void)
{
    char LETRA;
    cout << "\n";
    cout << "Tecle <C> + <ENTER> para finalizar..";
    do
    {
        LETRA = cin.get ();
        LETRA = toupper (LETRA);
    }
    while (LETRA != 'C');
    return 0;
}
