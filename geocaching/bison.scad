hBisonMain = 44;
hBisonCap = 6;
dBisonMain = 18;
dBisonCap = 7;
wall = 2;

 $fn=60;

bison();
//lower();



module lower() {
    side = dBison+2*wall;
    translate([-side/2,-side/2,0])
    cube([side,side, hBison]);
}

//svg();


module svg() {
    
    linear_extrude(height=2) {            
        resize([50,50,0])    
        import("geocaching.svg", center=true);
    }
}

module bison() {    
    roundedCylinder(dBisonMain, hBisonMain, 3, 1.5);
    translate([0,0,hBisonMain])
        roundedCylinder(dBisonCap, hBisonCap, 1/1000, 1);    
    
}

module roundedCylinder(d, h, r0, r1) {
    hull() {
        translate([0,0,r0])
        torus(r0, d);    
        translate([0,0,h-r1])
            torus(r1, d);    
    }
}

module torus(r, d) {
    rotate_extrude()
        translate([d/2-r,0,0])
            circle(r);
}