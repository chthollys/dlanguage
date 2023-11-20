module solverp29_v3;
import std.stdio;
import std.algorithm.sorting;
import std.algorithm;
import std.conv;

class Solver_P29{
    int[] solverCase(int[] x){
        int[] index=new int[x.length];       
        makeIndex!("a < b")(x,index);
        return index;
    }

    int[] split(string y,int ncase){
        int x;
        int[] val;
        for(int i;i<y.length;i++){
            if(y[i]==' '){
                val~= to!int(y[x..i]);
                x=i+1;
            }if(val.length==ncase-1){
                val~= to!int(y[x..$]);
                break;
            }
        }
        return val;
    }
}