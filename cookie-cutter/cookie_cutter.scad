nozzle_size=0.4;

height = 15;
support_width = 6;
 
support();
cutter();     

module support() {
    translate([6,-5,0])
    difference()  {
        cylinder(h=nozzle_size*3,r=21.5);
        cylinder(h=nozzle_size*3,r=15.5);
        
        label();
    }
}

module cutter(){
    edge(nozzle_size*3,support_width,0);
    edge(nozzle_size*7,nozzle_size*2,0);
    edge(height,0,-nozzle_size*2);
}

module edge(h, r_out, r_in){
    linear_extrude(height=h) {
        difference(){
            offset(r=r_out)
            svg();
            offset(r=r_in)
            svg();
        }
    }
}

module svg() {
    // Change dimensions of the thing in the SVG (XML).
    import("dove.svg",center=true);
}

module label(){
    // A bit of a mess, but work with a few tweaks.
    translate([0,0,nozzle_size*2]){
        label_text="♥LISA♥";
        label_width=32.5;
        label_height=2;
        chars=len(label_text)+1;
        degrees=80 ;
        for (i = [1:chars]) {
            rotate([0,0,76-i*(degrees/chars)])
            translate([0,label_width/2,0])
            linear_extrude(label_height)
            text(label_text[i-1],halign="center", size=4, font="Segoi UI Semibold");
        }
    }
}
