$fn=256;

widthWall=1.5;

overhang=3;
poleMargin=overhang/2;
diameterPole=60;
heightCork=5;
heightWedge=20;
diameterHole=8;

pole();

#difference() {
    cork();
    hole();
}

module pole() {
    translate([0,0,-20]) {
        difference(){
            cylinder(h=20,d=diameterPole,center=false);
            cylinder(h=20.1,d=diameterPole-widthWall*2,center=false);
        }
    }
}

module cork() {
    cylinder(h=heightCork,d=diameterPole+overhang*2,center=false);
    translate([0,0,-heightWedge]) {
        cylinder(h=heightWedge,d1=20,d2=diameterPole-widthWall*2-poleMargin*2,center=false);
    }
}

module hole() {
    translate([0,0,-50])
    cylinder(h=100,d=diameterHole, center=false);
}