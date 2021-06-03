#include "../include/ntt.h"
#include "../include/utils.h"
using namespace std;

uint64_t* peaceNTT(uint64_t * vec, uint64_t p, uint64_t g){
    uint64_t *xt, *y;
    uint64_t w;
    uint64_t * yt = (uint64_t*)calloc(VECTOR_SIZE, sizeof(uint64_t));
    for(uint64_t i = 0; i < VECTOR_SIZE; i++)
        yt[i] = 0;
    uint64_t t = (uint64_t)log2(VECTOR_SIZE);
    cout<<"Peace NTT\nt: "<<t<<endl;
    //xt = bit_reverse(vec, VECTOR_SIZE);
    xt = vec;
    cout<<"Complte bit_reverse.\n";
    //printVec(xt, VECTOR_SIZE);
    for (uint64_t c = t; c >= 1; c--){
        w = modExp(g, (p-1)/exp2(t-c+1), p);
        for (uint64_t r = 0; r < exp2(t-1); r++){
            uint64_t r1 = floor(r/(exp2(c-1)));
            xt[r*2+2] = pow(w, r1) * xt[2*r+2];
            yt[r+1] = xt[2*r+1] + xt[2*r+2];
            yt[r+VECTOR_SIZE/2+1] = xt[2*r+1] - xt[2*r+2];
            //cout<<"c: "<<c<<" r: "<<r<<" r max: "<<exp2(t-1)<<endl;
        }
        xt = yt;
        cout<<"Complte stage: "<<c<<" computation.\n";
        //printVec(xt, VECTOR_SIZE);
    }
    y = yt;
    //printVec(yt, VECTOR_SIZE);
    return yt;
}