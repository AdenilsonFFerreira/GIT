// Calculo da simulação dos ganhos

#include <iostream>
#include <iomanip>
using namespace std;

int main (void)
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
}
