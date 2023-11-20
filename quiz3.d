module main;
import solver_p29_v3;
import std.stdio;
import std.conv;
import std.algorithm;

void main(){
    int nofcase;
    write("Input total val ; ");
    readf("%d\n",nofcase);
    string nofvals;
    write("Values ; ");
    readf("%s\n",sval);
    int[] value= new Solver_P29().split(nofvals,nofcase);
    int[] index= new Solver_P29().solverCase(value);
    index.each!(x => writef("%d ",x+1)),write("\n");
}