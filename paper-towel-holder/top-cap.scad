$fn=120;
h=20;
r = 27/2;
nozzle=0.4;
wall = 4*nozzle;

h_mag=7;
d_mag=20;
m_screw=4;

translate([0,0,h-h_mag-wall]) {
    difference(){
        cylinder(h_mag+wall,r+wall,r+wall);
        translate([0,0,wall])
        cylinder(h_mag*2,d_mag/2,d_mag/2);
        #translate([0,0,-wall])
        cylinder(h_mag*2,m_screw/2,m_screw/2);
    }
}

difference(){
    cylinder(h,r+wall,r+wall);
    translate([0,0,-h/2])
    cylinder(h*2,r,r);
}