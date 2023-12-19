import std.stdio;
import std.array;
import std.container;
import std.typecons;
import std.string;
import core.stdc.stdlib;
import std.algorithm.sorting;
import std.format;
import std.algorithm;
import std.random;
import std.conv;


void main(){
    int numFibonacci = 100; // first numFibonacci to generate
    int k = 5; // resampleing and randomizing times
    ulong[][] resampledData;
    Array!ulong n = generateFibonacci(numFibonacci);// n as container of resampling result
    ulong[] n2 = n.array;
    //writeln(n[]);
    for (int i = 0; i < k; i++){
        Array!ulong resampled = Array!ulong(resampleData(n2));
        resampledData ~= resampled.array;
    }
    writeln("Resampled Data:");
    foreach (trial; resampledData){
        writeln(trial);
    }
}

Array!ulong generateFibonacci(int num){
    Array!ulong result;
    if (num >= 1){
        result.insertBack(1);
    }
    if (num >= 2){
        result.insertBack(2);
    }
    for (int i = 2; i < num; ++i){
        ulong nextFibo = result[i - 1] + result[i - 2];
        result.insertBack(nextFibo);
    }
    return result;
}

ulong[] resampleData(ulong[] data){
    for(int i = 0 ; i < data.length; i++){
        auto randomIndex = uniform(0, data.length - 1);
        swap(data[i], data[randomIndex]);
    }
    return data;
}
