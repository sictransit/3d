$fn=120;
h_pin=10;
d_pin=27;

nozzle=0.4;
wall = 2*nozzle;


difference(){
    
    
    bottom();
    translate([0,0,wall])
    label();
    translate([0,0,-wall])
    

    union(){
        cylinder(3*wall,6,6);
        cylinder(5*wall, 2,1.5);
    }
}

module label() {
    steps=5;
    
    s = "SCOUT";
    
    for(i=[0:steps-1]){
        o=54;
        r_step=360/steps;
        r_ofs=r_step/2;
        t_rot=180-r_step*(i+0.5);
        translate([sin(i*r_step+r_ofs)*o,cos(i*r_step+r_ofs)*o])
        rotate([0,0,t_rot]){
            linear_extrude(height=2*wall, convexity=4)
            text(s[steps-i-1],size=14,font="Arial Black", valign= "center", halign="center");
        }
    }
}


module bottom(){
    ofs=39;  
    r_outer=62;
    difference() {
        cylinder(2*wall,r_outer,r_outer);
        translate([0,0,0])
        #symbols(ofs, wall*2);
    }
        
    pin(h_pin, d_pin/2);
}

module symbol(d,h) {
    svg(d,h*2);
}

module symbols(o, symbolHeight) {
    steps=5;
    
    for(i=[0:steps-1]){
        d_symbol=44;
        r_step=360/steps;
        translate([sin(i*r_step)*o,cos(i*r_step)*o])
        rotate([0,0,180-i*r_step])
        symbol(d_symbol,symbolHeight);
    }
}

module pin(h,r) {
    difference() {
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
