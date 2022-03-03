
public class Kmap
{
 String track[]={"-1","-1","-1","-1","-1","-1","-1","-1"};
 int k=0;
 
 boolean check(String s1, String s2)
{
int c=0;
for(int i=0; i<8; i++)
{
if (track[i].equals(s1)) c=c+1;
if (track[i].equals(s2)) c=c+1;
}
if (c==2) return false;
else return true;
}

 boolean check(String s1)
{
int c=0;
for(int i=0; i<8; i++)
{
if (track[i].equals(s1)) c=c+1;
}
if (c==1) return false;
else return true;
}

 void add(String s)
{
int c=0;
for(int i=0;i<7;i++)
{
if(track[i].equals(s))
{
c=c+1;
break;
}
}
if(c!=1)
{
k=k+1;
track[k]=s;
}
}

 String mapsolver(int arr[])
{
String str="";
int a[][]=new int[2][4];
for(int i=0;i<arr.length;i++)
{
if(arr[i]==0) a[0][0]=1;
if(arr[i]==1) a[0][1]=1;
if(arr[i]==2) a[0][3]=1;
if(arr[i]==3) a[0][2]=1;
if(arr[i]==4) a[1][0]=1;
if(arr[i]==5) a[1][1]=1;
if(arr[i]==6) a[1][3]=1;
if(arr[i]==7) a[1][2]=1;
}
int c=0;
for(int i=0;i<=1;i++)
{
for(int j=0;j<=3;j++)
{
if(a[i][j]==1) c=c+1;
}
}
if (c==8) return "1";
if (c==0) return "0";
else
{
int c1=0;
if(a[0][0]==1 && a[1][0]==1 && a[0][1]==1 && a[1][1]==1) 
{
str=str+"+B'"; c1=1;
add("00"); add("10"); add("01"); add("11");
}
if(a[0][1]==1 && a[1][1]==1 && a[0][2]==1 && a[1][2]==1) 
{
str=str+"+C"; c1=1;
add("01"); add("11"); add("02"); add("12");
}
if(a[0][2]==1 && a[1][2]==1 && a[0][3]==1 && a[1][3]==1) 
{
str=str+"+B"; c1=1;
add("02"); add("12"); add("03"); add("13");
}
if(a[0][0]==1 && a[1][0]==1 && a[0][3]==1 && a[1][3]==1) 
{
str=str+"+C'"; c1=1;
add("00"); add("10"); add("03"); add("13");
}
if(a[0][0]==1 && a[0][1]==1 && a[0][2]==1 && a[0][3]==1)
{
str=str+"+A'"; c1=1;
add("00"); add("01"); add("02"); add("03");
}
if(a[1][0]==1 && a[1][1]==1 && a[1][2]==1 && a[1][3]==1)
{
str=str+"+A"; c1=1;
add("10"); add("11"); add("12"); add("13");
}
if(a[0][0]==1 && a[0][1]==1 && check("00","01")==true)
{
str=str+"+A'B'";
add("00"); add("01");
}
if(a[0][1]==1 && a[0][2]==1 && check("01","02")==true)
{
str=str+"+A'C";
add("01"); add("02");
}
if(a[0][2]==1 && a[0][3]==1 && check("02","03")==true)
{
str=str+"+A'B";
add("02"); add("03");
}
if(a[0][0]==1 && a[0][3]==1 && check("00","03")==true)
{
str=str+"+A'C'";
add("00"); add("03");
}
if(a[1][0]==1 && a[1][1]==1 && check("10","11")==true)
{
str=str+"+AB'";
add("10"); add("11");
}
if(a[1][1]==1 && a[1][2]==1 && check("11","12")==true)
{
str=str+"+AC";
add("11"); add("12");
}
if(a[1][2]==1 && a[1][3]==1 && check("12","13")==true)
{
str=str+"+AB";
add("12"); add("13");
}
if(a[1][0]==1 && a[1][3]==1 && check("10","13")==true)
{
str=str+"+AC'";
add("00"); add("03");
}
if(a[0][0]==1 && a[1][0]==1 && check("00","10")==true)
{
str=str+"+B'C'";
add("00");add("10");
}
if(a[0][1]==1 && a[1][1]==1 && check("01","11")==true)
{
str=str+"+B'C";
add("01");add("11");
}
if(a[0][2]==1 && a[1][2]==1 && check("02","12")==true)
{
str=str+"+BC";
add("02");add("12");
}
if(a[0][3]==1 && a[1][3]==1 && check("03","13")==true)
{
str=str+"+BC'";
add("03");add("13");
}
if(c1==0)
{
if(a[0][0]==1 && check("00")==true) str=str+"+A'B'C'";
if(a[0][1]==1 && check("01")==true) str=str+"+A'B'C";
if(a[0][2]==1 && check("02")==true) str=str+"+A'BC";
if(a[0][3]==1 && check("03")==true) str=str+"+A'BC'";
if(a[1][0]==1 && check("10")==true) str=str+"+AB'C'";
if(a[1][1]==1 && check("11")==true) str=str+"+AB'C";
if(a[1][2]==1 && check("12")==true) str=str+"+ABC";
if(a[1][3]==1 && check("13")==true) str=str+"+ABC'";
}
}
if(str.length()>1) str=str.substring(1,str.length());
// redundancy checking and removing
int cc0=0; str=str+" "; int l=str.length();
for(int j=0;j<l;j++)
{
if(str.charAt(j)=='+') cc0+=1;
}
if(cc0==2)
{
String wd[] = new String[3]; int k=0;
for(int j=0;j<l;j++)
{
if(str.charAt(j)=='+') k=k+1;
else wd[k]=wd[k]+str.charAt(j);
}
int cc1=0; int cc2=0; int cc3=0;
for( int j=0;j<wd[0].length();j++)
{
if(wd[0].charAt(j)=='A' || wd[0].charAt(j)=='B' || wd[0].charAt(j)=='C') cc1+=1;
}
for( int j=0;j<wd[1].length();j++)
{
if(wd[1].charAt(j)=='A' || wd[1].charAt(j)=='B' || wd[1].charAt(j)=='C') cc2+=1;
}
for( int j=0;j<wd[2].length();j++)
{
if(wd[2].charAt(j)=='A' || wd[2].charAt(j)=='B' || wd[2].charAt(j)=='C') cc3+=1;
}
if(cc1==2 && cc2==2 && cc3==2)
{
char ch='0'; int k0=0;
for( char j='A';j<='C';j++)
{
if((str.charAt(str.indexOf(j)+1) != '\'' && str.charAt(str.lastIndexOf(j)+1) == '\'') || (str.charAt(str.indexOf(j)+1) == '\'' && str.charAt(str.lastIndexOf(j)+1)!= '\''))
{
ch=j; k0=k0+1;
}
}
if(k0==1)
{
if(wd[0].indexOf(ch)==-1) str=wd[1].substring(4,wd[1].length())+"+"+wd[2].substring(4,wd[2].length());
if(wd[1].indexOf(ch)==-1) str=wd[0].substring(4,wd[0].length())+"+"+wd[2].substring(4,wd[2].length());
if(wd[2].indexOf(ch)==-1) str=wd[0].substring(4,wd[0].length())+"+"+wd[1].substring(4,wd[1].length());
}
}
}
return str;

}
}




