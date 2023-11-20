module main;
import solver29;
import std.stdio;
import std.conv;
import std.algorithm;

void main(){
    int ncase;
    write("Input total val ; ");
    readf("%d\n",ncase);
    string sval;
    write("Values ; ");
    readf("%s\n",sval);
    int[] val= new SolveCA29().split(sval,ncase);
    int[] index= new SolveCA29().solverCase(val);
    index.each!(x => writef("%d ",x+1)),write("\n");
}