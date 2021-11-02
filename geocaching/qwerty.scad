$fn=32;

side = 100/7;
height = 1;
slant = 2.5;

cr = 2;
safe = 1;

d_nano=11.2;

resolution = 0.16;
spacing = side;


print();

module print() {
    
    
    difference(){
        keyboard();
        #nano();
    }
    
    
    
}

module nano() {
    translate([side*3.5,0,-10])
    cylinder(20,d_nano/2,d_nano/2);
    }
    
    
module hole(offset) {
    translate([offset,0,-resolution*8-2])
    cube([5,26,4], center=true);
    }    
    
module back() {
    hull(){
translate([-resolution,-side-resolution,-resolution*8])
cube([7*side+2*resolution,2*side+2*resolution,resolution*8]);

translate([0,-35/2,-resolution*8-2])
cube([100,35,2]);
    }

    }    


module keyboard() {
    difference(){
back();
        #hole(6.4+5/2);
        #hole(100-(6.4+5/2));
    }
    keyrow(0, 0, ["G","C","9","G","0","5", "H"]);
    keyrow(side/4*2,-side, ["Q","W","E","R","T","Y"]);
    
}

module keyrow(dX, dY, chars) {
    for (idx = [ 0 : len(chars) - 1 ] ) {
        translate([dX,dY,0])
            key(chars[idx], spacing*idx);
    }
}


module key(char, offset) {
    translate([offset,0,0])
    keycap(char);    
}



module keycap(letter) {
    
    h=resolution*4;
    
    difference(){
        hull(){
            topbottom (0, 0);
            topbottom (height, slant);
        }
        translate([0,0,-safe*2]) {
            cube([side, side, safe*2]);
        }        
        translate([side/2,side/2,height-h]) {
            linear_extrude(height=2*h, convexity=4)
                text(letter,size=8,valign="center", halign="center",font="Arial Black" );
        }    
    }
    
}

module topbottom(h, s) {
    translate([cr+s/2,cr+s/2,-safe+h])
    cylinder(safe,cr,cr);
    
    translate([side-cr-s/2,cr+s/2,-safe+h])
    cylinder(safe,cr,cr);
    
    translate([cr+s/2,side-cr-s/2,-safe+h])
    cylinder(safe,cr,cr);
    
    translate([side-cr-s/2,side-cr-s/2,-safe+h])
    cylinder(safe,cr,cr);
}