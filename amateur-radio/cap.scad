dPole = 30;
wPole = 3;
hPole = 102;
hTop=5;

wNozzle=0.4;

polys=60;

$fn=polys;

difference() {
    polefitting();
    screw();
}

module screw() {
    #translate([0,0,hPole])
    cylinder(h=hTop, r=wNozzle*8, center=false);
}


module polefitting() {
    difference(){
        cap();
        threads();        
    }
}


module threads() {
    thread(dPole/2-wNozzle*5, 1080);
    thread(-(dPole/2-wNozzle*5), -1080);
}

module thread (dx, twist) {
    translate([0,0,0]){
        linear_extrude(height = hPole, convexity = 10, twist = twist)
        translate([dx, 0, 0])
        circle(r = wPole);
    }
}

module cap() {
    difference() {       
        pole(hPole+hTop, dPole/2+wPole);
        pole(hPole, dPole/2);
    };
}

module pole(height, radius){
    cylinder(h=height, r=radius, center=false);
}