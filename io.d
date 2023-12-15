module io;

import std.stdio;
import std.container;
import std.typecons;

int[] parse_stdin(){
    int ncase;
    readf!"%d\n"(ncase);
    //writefln("%d", ncase);
    int[] data = new int[ncase];
    //Array!int data;
    int v;
    for(int i=0; i< ncase;i++){
        readf(" %d", v);
        data[i]=v;
    }
    return data;
}

int[] parse_input(string path){
    File file = File(path, "r");
    int ncase;
    file.readf!"%d\n"(ncase);
    //writefln("%d", ncase);
    int[] data = new int[ncase];
    //Array!int data;
    int v;
    for(int i=0; i< ncase;i++){
        file.readf!"%d "(v);
        data[i]=v;
    }
    return data;
}

void printIntArray(int[] arr){
    foreach (int val; arr)
    {
        writef("%d 1", val);
    }
}

void printStringArray(string[] arr){
    foreach (string val; arr)
    {
        writeln(val);
    }
}

template print(T){
    void printArray(T[] arr){
        foreach (T val; arr)
        {
            writef("%d ", val);
        }
        writeln();
    }
    /*
    void printContainerArray(T arr){
        foreach(T val; arr){
            writeln(val);
        }
    }*/
}


void copy_array(int[] a, int[] b){
    for(int i=0;i<b.length;i++){
        a[i] = b[i];
    }
}

void printArrayOfTuple(Array!(Tuple!(Array!bool, Array!bool)) data){
    foreach (pair; data)
    {
        string bits1 = boolArrayToString(pair[0]);
        string bits2 = boolArrayToString(pair[1]);
        writefln("%s %s", bits1, bits2);
    }
}

string boolArrayToString(Array!bool bits){
    string bitstring = "";

    foreach (bit; bits)
    {
        if(bit == true)
            bitstring ~= "1";
        else
            bitstring ~= "0";
    }
    return bitstring;
}

void printBoolArray(Array!bool bits){
    string bitstring = "";

    foreach (bit; bits)
    {
        if(bit == true)
            bitstring ~= "1";
        else
            bitstring ~= "0";
    }
    writeln(bitstring);
 } 

 void printArrayOfBoolArray(Array!(Array!bool) X){
    foreach (x; X)
    {
        string val = boolArrayToString(x);
        //bool[] bits = new bool[len];
        writeln(val);
    }
}
