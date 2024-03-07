#include <iostream>
#include <iomanip>
using namespace std;

int main (void)

{
    float Num1, Num2, Num3, Media;

    cout << "Entre com o valor 01: "; cin >> Num1;
    cout << endl;
    cout << "Entre com o valor 02: "; cin >> Num2;
    cout << endl;
    cout << "Entre com o valor 03: "; cin >> Num3;
    cout << endl;

    Media = (Num1 + Num2 + Num3) / 3;

    cout << "Resultado = "; cout << setprecision (3) << Media;

    return 0;
}
