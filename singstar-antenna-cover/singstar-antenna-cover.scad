$fn=120;

nozzle=0.4;
//wall = 3*nozzle;

h1=16;
h2=30;

ro1=29.5/2;
ri1=27.2/2;
wall=ro1-ri1;

echo(wall);

ri2=26/2;
ro2=ri2+wall;

ro3=19/2;
ri3=ro3-wall;

ro4=15.5/2;
ri4=ro4-wall;

echo(ri3);

echo (ro2);

tube(h1, ri1, ri2, ro1, ro2);

translate([0,0,h1])
tube(h2, ri3, ri4, ro3, ro4);

#translate([0,0,h1+h2-wall])
tube(wall, 0, 0, ro4, ro4);

#translate([0,0,h1-wall])
tube(wall, ri3-wall, ri3-wall, ro2, ro2);

module tube(h, riB, riT, roB, roT){
    difference(){
    cylinder(h,roB,roT,false);
        translate([0,0,-wall/2])
        cylinder(h+wall,riB,riT,false);
    }
}

