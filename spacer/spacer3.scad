w=95;
h=15;
d=15;

t=1.6;

difference(){
    cube([w,d,h], true);  
    translate([0,0,t])  
    #cube([w-t*2,d-t*2,h],true);
}
