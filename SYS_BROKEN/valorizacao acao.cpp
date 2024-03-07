// programa pra calculo de valorização de ações

#include <iostream>
#include <iomanip>
using namespace std;

int main (void)
{
    // vi = valor incial da ação
    // vf = valor final da ação
    // por = porcentagem de aumento
    // sim = valor escolhido a simular

    float VI, VF, POR;

    cout << "Entre com o valor inicial da acao..: "; cin >> VI;
    cout << "Entre com a valor atual da acao....: "; cin >> VF;
    POR = (VF*100)/VI-100;

    cout << endl;
    cout << "A açao teve uma valorizaçao de.....: " << POR << "%";
    cout << endl;
    cout << endl;
}

