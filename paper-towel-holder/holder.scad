$fn=120;
h_pin=15;
d_pin=27;

nozzle=0.4;
wall = 3*nozzle;


difference(){

bottom();
    translate([0,0,-wall])
    union(){
    cylinder(3*wall,6,6);
    cylinder(5*wall, 2,1.5);
    }
}


module bottom(){
    ofs=39.25;
    r_outer=62;
    difference(){
        cylinder(2*wall,r_outer+2*wall,r_outer+2*wall);
        translate([0,0,-wall])
        cylinder(4*wall,r_outer,r_outer);
        }
    
    r_inner=ofs/2-2;
    cylinder(2*wall,r_inner,r_inner);
    
    
    steps=5;
    
    
    
for(i=[0:steps]){
    
    d_symbol=43;
    r_step=360/steps;
    translate([sin(i*r_step)*ofs,cos(i*r_step)*ofs])
    rotate([0,0,180-i*r_step])
symbol(d_symbol,2*wall);
}

pin(h_pin, d_pin/2);
}

module symbol(d,h) {
    difference(){
    
    cylinder(h=h,r=d/2+2*wall);    
        translate([0,0,-h/2])
    svg(d,h*2);
    }
    
    
}

module pin(h,r) {
    difference()    {
    cylinder(h=h,r=r+wall);
        translate([0,0,4*wall])
    cylinder(h=h,r=r );
    }
}

module svg(d,h) {
    linear_extrude(height=h)
    resize([d,d,0])    
    import("scouterna.svg", center=true);
    }

