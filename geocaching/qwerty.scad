//$fn=40;

side = 19;
height = 2;
slant = 2;

cr = 2;
safe = 1;

resolution = 0.16;
spacing = side;


print();

module print() {
    
    difference(){
        keyboard();
        #logo();
        #copy();
    }
    
}

module copy() {
    
    translate([side/2+-1,-2*side+3,-5])
    rotate([0,0,90])
    linear_extrude(height=10) {    
        text("MICKE",size=7,font="Segoe Script" );
        }      
}

module logo() {
    
    translate([7.25*side,-side/2,-5])
    linear_extrude(height=10) {    
        resize([side*0.9,side*0.90,0])    
        import("geocaching.svg", center=true);
    }
}

module keyboard() {
translate([-resolution,-2*side-resolution,-resolution*8])
cube([8*side+2*resolution,3*side+2*resolution,resolution*8]);

    keyrow(0, 0, ["G","E","O","C","A","C", "H", "E"]);
    keyrow(side/4*2,-side, ["Q","W","E","R","T","Y"]);
    keyrow(side/4*2+side/4,-side*2, ["G","C","9","G","0","5", "H"]);
    
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
        translate([slant,side-slant-8,height-h]) {
            linear_extrude(height=2*h, convexity=4)
                text(letter,size=8,font="Arial Black" );
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