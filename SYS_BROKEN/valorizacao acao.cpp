// programa pra calculo de valoriza��o de a��es

#include <iostream>
#include <iomanip>
using namespace std;

int main (void)
{
    // vi = valor incial da a��o
    // vf = valor final da a��o
    // por = porcentagem de aumento
    // sim = valor escolhido a simular

    float VI, VF, POR;

    cout << "Entre com o valor inicial da acao..: "; cin >> VI;
    cout << "Entre com a valor atual da acao....: "; cin >> VF;
    POR = (VF*100)/VI-100;

    cout << endl;
    cout << "A a�ao teve uma valoriza�ao de.....: " << POR << "%";
    cout << endl;
    cout << endl;
}

