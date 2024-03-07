// Calculo dos seus Ganhos
#include <iostream>
#include <iomanip>
using namespace std;

int main (void)
{
    float VAC, POR, TOTAL;

    cout << "Caso queira escolha um valor a simular" << endl;
    cout << "--------------------------------------" << endl;
    cout << endl;

    cout << "Entre com o valor de ações compradas: "; cin >> VAC;
    cout << "Entre com a porcentagem de ganho....: "; cin >> POR;

    TOTAL = (POR/100)*VAC;

    cout << "Os ganhos foram de: " << TOTAL;
    cout << endl;
    cout << "Total = "; cout << VAC + TOTAL;
    cout << endl;
    cout << endl;
    return 0;
}
