import java.util.*;
public class user_display
{

public static String Dec2bin (int i)
{
String str="";
for(int k=i; k!=0;k=k/2)
{
str=k%2+str;
}
int l=str.length();
while(l<3)
{
str="0"+str;
l=str.length();
}
return str;
}

static String replace(String s)
{
String ss = "";
for(int i=0; i<s.length();i++)
{
if(s.charAt(i)=='A') ss=ss+"Q1";
else if(s.charAt(i)=='B') ss=ss+"Q0";
else if(s.charAt(i)=='C') ss=ss+"X";
else ss=ss+s.charAt(i);
}
return ss;
}

public static void main() 
{
    Scanner sc = new Scanner(System.in);
    String ans;
    do{
    System.out.println("Please select the type of flipflop you wish to use.");
    System.out.println();
    System.out.println("Enter 1 for SR FlipFlop");
    System.out.println("Enter 2 for JK FlipFlop");
    System.out.println("Enter 3 for D FlipFlop");
    System.out.println("Enter 4 for T FlipFlop");
    System.out.println();
    int ff = sc.nextInt();
    System.out.println();
    System.out.println("Please fill the state table.");
    System.out.println();
    System.out.println("Present state(Q1 Q0)  Input(x)  Next state(Q1 Q0)  Output(y)");
    System.out.println("-------------------------------------------------------------------");
    int presentstate[][] = new int[8][2];
    int nextstate[][] = new int[8][2];
    ArrayList<Integer> Y = new ArrayList<Integer>();
    for(int i=0 ; i<8 ; i++)
    {
        String s = Dec2bin(i);
        presentstate[i][1] = Integer.parseInt(s.substring(0,1));
        presentstate[i][0] = Integer.parseInt(s.substring(1,2));
        String q=""; int out=0; 
        do
        {
        try{
        System.out.print("\n \t"+ s.substring(0,2)+"   \t  \t "+ s.charAt(2)+"      \t");
        q = sc.next();
        nextstate[i][1] = Integer.parseInt(q.substring(0,1));
        nextstate[i][0] = Integer.parseInt(q.substring(1,2));
        System.out.print("\t");
        out = sc.nextInt(); 
        }
        catch(NumberFormatException e)
        {
        System.out.println("Enter valid input.");
        }
        catch(StringIndexOutOfBoundsException e)
        {
        System.out.println("Enter valid input.");
        }
        catch(InputMismatchException e)
        {
        System.out.println("Enter valid input.");
        }
        if(out!=1 && out!=0) System.out.println("Enter valid input.");
        if(out==1) Y.add(i);
        } while((q!="00" && q!="01" && q!="10" && q!="11") && (out!=1 && out!=0));
    }
         
    int Output[] = new int[Y.size()];
    for(int j=0; j<Y.size();j++) {
        Output[j]=Y.get(j); 
    }
    System.out.println(); 
    Kmap ob = new Kmap(); 
     String ffY = "";
    switch(ff)
    {
        case 1:
        ArrayList<Integer> s0 = new ArrayList<Integer>(); 
        ArrayList<Integer> r0 = new ArrayList<Integer>(); 
        ArrayList<Integer> s1 = new ArrayList<Integer>(); 
        ArrayList<Integer> r1 = new ArrayList<Integer>(); 
        for(int i=0; i<8;i++)
        {
            if(presentstate[i][0] == 0 && nextstate[i][0] == 1) s0.add(i);
            if(presentstate[i][0] == 1 && nextstate[i][0] == 0) r0.add(i);
            if(presentstate[i][1] == 0 && nextstate[i][1] == 1) s1.add(i);
            if(presentstate[i][1] == 1 && nextstate[i][1] == 0) r1.add(i);
        }
        int S0[] = new int[s0.size()];
        int R0[] = new int[r0.size()];
        int S1[] = new int[s1.size()];
        int R1[] = new int[r1.size()];
        for(int j=0; j<s0.size();j++) S0[j]=s0.get(j);
        for(int j=0; j<r0.size();j++) R0[j]=r0.get(j);
        for(int j=0; j<s1.size();j++) S1[j]=s1.get(j);
        for(int j=0; j<r1.size();j++) R1[j]=r1.get(j);
        
        String ffS0 = replace(ob.mapsolver(S0));
        String ffR0 =  replace(ob.mapsolver(R0));
        String ffS1 =  replace(ob.mapsolver(S1));
        String ffR1 =  replace(ob.mapsolver(R1));
        ffY =  replace(ob.mapsolver(Output));
        System.out.println("S0 = "+ffS0);
        System.out.println("R0 = "+ffR0);
        System.out.println("S1 = "+ffS1);
        System.out.println("R1 = "+ffR1);
        System.out.println("Y = "+ffY);
        break;
        
        case 2:
        ArrayList<Integer> j0 = new ArrayList<Integer>(); 
        ArrayList<Integer> k0 = new ArrayList<Integer>(); 
        ArrayList<Integer> j1 = new ArrayList<Integer>(); 
        ArrayList<Integer> k1 = new ArrayList<Integer>(); 
        for(int i=0; i<8;i++)
        {
            if(presentstate[i][0] == 0 && nextstate[i][0] == 1) j0.add(i);
            if(presentstate[i][0] == 1 && nextstate[i][0] == 0) k0.add(i);
            if(presentstate[i][1] == 0 && nextstate[i][1] == 1) j1.add(i);
            if(presentstate[i][1] == 1 && nextstate[i][1] == 0) k1.add(i);
        }
        int J0[] = new int[j0.size()];
        int K0[] = new int[k0.size()];
        int J1[] = new int[j1.size()];
        int K1[] = new int[k1.size()];
        for(int j=0; j<j0.size();j++) J0[j]=j0.get(j);
        for(int j=0; j<k0.size();j++) K0[j]=k0.get(j);
        for(int j=0; j<j1.size();j++) J1[j]=j1.get(j);
        for(int j=0; j<k1.size();j++) K1[j]=k1.get(j);
       
        String ffJ0 = replace(ob.mapsolver(J0));
        String ffK0 =  replace(ob.mapsolver(K0));
        String ffJ1 =  replace(ob.mapsolver(J1));
        String ffK1 =  replace(ob.mapsolver(K1));
        ffY =  replace(ob.mapsolver(Output));
        System.out.println("J0 = "+ffJ0);
        System.out.println("K0 = "+ffK0);
        System.out.println("J1 = "+ffJ1);
        System.out.println("K1 = "+ffK1);
        System.out.println("Y = "+ffY);
        break;
        
        case 3:        
        ArrayList<Integer> d0 = new ArrayList<Integer>(); 
        ArrayList<Integer> d1 = new ArrayList<Integer>();        
        for(int i=0; i<8;i++)
        {
            if(presentstate[i][0] == 0 && nextstate[i][0] == 1) d0.add(i);
            if(presentstate[i][0] == 1 && nextstate[i][0] == 1) d0.add(i);     
            if(presentstate[i][1] == 0 && nextstate[i][1] == 1) d1.add(i);
            if(presentstate[i][1] == 1 && nextstate[i][1] == 1) d1.add(i);
        }
        int D0[] = new int[d0.size()];
        int D1[] = new int[d1.size()];        
        for(int j=0; j<d0.size();j++) D0[j]=d0.get(j);
        for(int j=0; j<d1.size();j++) D1[j]=d1.get(j);
             
        String ffD0 =  replace(ob.mapsolver(D0));
        String ffD1 =  replace(ob.mapsolver(D1));
        ffY =  replace(ob.mapsolver(Output));        
        System.out.println("D0 = "+ffD0);
        System.out.println("D1 = "+ffD1);
        System.out.println("Y = "+ffY);
        break;
        
         case 4:        
        ArrayList<Integer> t0 = new ArrayList<Integer>(); 
        ArrayList<Integer> t1 = new ArrayList<Integer>();        
        for(int i=0; i<8;i++)
        {
            if(presentstate[i][0] == 0 && nextstate[i][0] == 1) t0.add(i);
            if(presentstate[i][0] == 1 && nextstate[i][0] == 0) t0.add(i);     
            if(presentstate[i][1] == 0 && nextstate[i][1] == 1) t1.add(i);
            if(presentstate[i][1] == 1 && nextstate[i][1] == 0) t1.add(i);
        }
        int T0[] = new int[t0.size()];
        int T1[] = new int[t1.size()];        
        for(int j=0; j<t0.size();j++) T0[j]=t0.get(j);
        for(int j=0; j<t1.size();j++) T1[j]=t1.get(j);
          
        String ffT0 =  replace(ob.mapsolver(T0));
        String ffT1 =  replace(ob.mapsolver(T1));
        ffY =  replace(ob.mapsolver(Output));        
        System.out.println("T0 = "+ffT0);
        System.out.println("T1 = "+ffT1);
        System.out.println("Y = "+ffY);
        break; 
        
        default: System.out.println("Invalid input"); 
    
} 
System.out.println("\nDo you wish to solve another problem?");
System.out.println("Type Yes to continue. Entering anything else will end the program.");
ans = sc.next();
}while(ans.equalsIgnoreCase("Yes"));

}
}
