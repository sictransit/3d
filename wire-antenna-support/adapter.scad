dPole = 30;
wPole = 3;
hPole = 100;

wNozzle=0.4;



$fn=60;
difference(){
cap();
#threads();
}

//threads();


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
    cylinder(h=hPole+wPole, r=dPole/2+wPole, center=false);
    translate([0,0,-wPole])
    cylinder(h=hPole+wPole, r=dPole/2, center=false);
};
}
