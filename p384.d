module p384;

import std.stdio;
import std.container;
import std.typecons;
import std.array;
import std.string;
import io;
import core.stdc.stdlib;
import std.algorithm.sorting;

// Name : Jason Januardy
// NIM  : 1313623035
void main(){
    string path = "../data";
    auto data = parse_input(path);
    process_vector(data);
    //Array!bool bit1 = Array!bool([false, false]);
    //Array!bool bit2 = Array!bool([true, true]);
    //Array!bool bit3 = merge(bit1, bit2);

}

void process_vector(Array!(Tuple!(Array!bool, Array!bool)) data){
    foreach (pair; data)
    {   
        // pair[0] first data = ((false, true, true), (true, true, false))
        ulong len = pair[0].length();// len = 3
        bool[] bits = new bool[len];// bits = (t/f, t/f, t/f)
        Array!(Array!bool) vectors = Array!(Array!bool)(); // vectors = ((bool, bool), (bool, bool), ..)
        generate_bitvectors(vectors, bits, len, 0);
        int num_matched = find_all_matching_hamming(vectors, pair[0], pair[1]);
        writef("%d ", num_matched);
        //printArrayOfBoolArray(vectors);
        //exit(-1);
    }
}

/** 
 * Fully adaptive generate full bitvectors of adaptive size
 * Params: 
 *   len = size of passed vector
 * Returns: Array!(Array!bool) 
 */
void generate_bitvectors(ref Array!(Array!bool) vectors, bool[] bits, ulong len, uint pos){
    // vectors = ((bool, bool), (bool, bool), ..)
    // bits = (t/f, t/f, t/f)
    // len = 3
    // pos = 1
    if(pos==len){
        Array!bool current_vector = Array!bool(bits);
        vectors.insertBack(current_vector);
    }
    else{
        //work only on current digit position
        bool[] space = [false, true];
        foreach (bool bit; space)
        {
            bits[pos] = bit;
            generate_bitvectors(vectors, bits, len, pos+1);
        }
    }
}

int find_all_matching_hamming(Array!(Array!bool) vectors, Array!bool A, Array!bool B){
    // vectors = [(all possibilities of array of bool(len)--> 2**len)]
    int matching = 0;
    foreach(test ; vectors){
        if(hamming_distance(test, A) == hamming_distance(test, B)){
            matching += 1;
        }
    }

    return matching;
}

uint hamming_distance(Array!bool x, Array!bool y){
    // x = [0, 1, 1] ; y = [1, 1, 0]
    ulong bit_count = x.length();
    uint hamming = 0;
    for(int i = 0; i < bit_count; i++){
        if(x[i] != y[i]){
            hamming += 1;
        }
    }

    return hamming;
}

/**
Authors: Me
This method only works for fixed length of 3
*/
/*Array!(Array!bool) generate_bitvectors_classic(ulong len){
    Array!(Array!bool) vectors = Array!(Array!bool)();
    bool[] space = [false, true];
    bool[] bits = new bool[len];
    foreach (bool bit; space)
    {
        bits[0] = bit;
        // 0
        //current_vector.insertBack(bit);
        foreach (bool bit2; space)
        {
            // 00
            //current_vector.insertBack(bit2);
            bits[1] = bit2;
            foreach (bool bit3; space)
            {
                bits[2] = bit3;
                Array!bool current_vector = Array!bool(bits);
                vectors.insertBack(current_vector);
            }
        }
    }
    return vectors;
}*/

Array!(Tuple!(Array!bool, Array!bool)) parse_input(string path){
    File file = File(path, "r");
    int ncase;
    file.readf!"%d\n"(ncase);
    auto data = Array!(Tuple!(Array!bool, Array!bool))();
    for(int i=0;i<ncase;i++){
        string v, v2;
        //file.readf!" %s %s "(v, v2);
        string line  = file.readln();
        //writeln(strip(line));
        //split v to as individual character
        string[] letter = strip(line).split();
        v = letter[0];
        v2 = letter[1];
        //writeln(v);
        //writeln(v2);
        Array!bool bletter = stringArrToBoolVector(v);
        Array!bool bletter2 = stringArrToBoolVector(v2);
        //writeln(bletter);
        //writeln(bletter2);
        Tuple!(Array!bool, Array!bool) pair;
        pair[0]=bletter;
        pair[1]=bletter2;
        data.insertBack(pair);
    }
    return data;
}
//v1 = 011 ; v2 = 110
Array!bool stringArrToBoolVector(string data){
    auto boolVector = Array!bool();
    for(int i=0;i<data.length;i++){
        //writeln(data[i]);
        if(data[i] == '1'){
            boolVector.insert(true);
        } else
            boolVector.insert(false);
    }
    return boolVector;
}