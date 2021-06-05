#include "../include/ntt.h"
#include "../include/utils.h"
using namespace std;

void cpyVec(uint64_t* src, uint64_t*dst, int length){
    for(int i=0; i<length; i++){
        dst[i] = src[i];
    }
}

uint64_t* peaceNTT(uint64_t * vec, uint64_t n, uint64_t p, uint64_t g, bool rev){

    uint64_t t = (uint64_t)log2(n);
    uint64_t * xt = vec;
    uint64_t * yt = (uint64_t*)calloc(n, sizeof(uint64_t));

    if(rev)
        xt = bit_reverse(vec, n);

    cout<<"Peace NTT\nt: "<<t<<endl;

    uint64_t r_strt = 0;
    uint64_t r_end  = exp2(t - 1);
    uint64_t mid = n / 2;
    for (uint64_t c = t; c >= 1; c--){

        uint64_t w = modExp(g, (p - 1) / exp2(t - c + 1), p);
        uint64_t base = exp2(c - 1);

        for (uint64_t r = r_strt; r < r_end; r++){
            uint64_t r1 = floor(r / base);
            uint64_t f1 = xt[r*2];
            uint64_t f2 = modulo(modExp(w, r1, p) * xt[r*2 + 1], p);
            yt[r]       = modulo(f1 + f2, p);
            yt[r+ mid]  = modulo(f1 - f2, p);
        }
        cpyVec(yt, xt, n);
        cout<<"Complte stage: "<<c<<" computation.\n";
        //printVec(xt,n);
    }
    return yt;
}