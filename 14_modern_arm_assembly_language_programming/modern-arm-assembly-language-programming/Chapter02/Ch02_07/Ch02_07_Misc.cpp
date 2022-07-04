//------------------------------------------------
//               Ch02_07_Misc.cpp
//------------------------------------------------

#include <iostream>
#include <iomanip>
#include <bitset>
#include <string>

using namespace std;

string ToHexString(unsigned int a)
{
    ostringstream oss;

    oss << setfill('0');
    oss << "0x" << hex << setw(8) << a;
    return oss.str();
}

string ToBitString(unsigned int a)
{
    bitset<32> bs {a};
    size_t n = bs.size();
    stringstream oss;

    for (size_t i = 0; i < n; i++)
    {
        oss << bs[n - 1 - i];

        if ((i + 1) % 4 == 0)
            oss << ' ';
    }

    return oss.str();
}

void PrintResultA(const char* msg, unsigned int a, unsigned int b, const unsigned int* c, size_t n)
{
    const char nl = '\n';
    string s[] { "a AND b", "a OR  b", "a EOR b" }; 

    cout << nl << msg << nl;

    cout << "a:    " << ToHexString(a);
    cout << " | " << ToBitString(a) << nl;
    cout << "b:    " << ToHexString(b);
    cout << " | " << ToBitString(b) << nl;

    for (size_t i = 0; i < n; i++)
    {
        cout << "c[" << i << "]: " << ToHexString(c[i]);
        cout << " | " << ToBitString(c[i]);
        cout << " | " << s[i] << nl;
    }
}

void PrintResultB(const char* msg, unsigned int a, const unsigned int* b, size_t n)
{
    const char nl = '\n';
    string s[] { "a AND 0x0000ff00", "a OR  0x00ff0000", "a EOR 0xff000000", "a AND 0x00ffff00" }; 

    cout << nl << msg << nl;

    cout << "a:    " << ToHexString(a);
    cout << " | " << ToBitString(a) << nl;

    for (size_t i = 0; i < n; i++)
    {
        cout << "b[" << i << "]: " << ToHexString(b[i]);
        cout << " | " << ToBitString(b[i]);
        cout << " | " << s[i] << nl;
    }
}

