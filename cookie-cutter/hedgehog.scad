nozzle_size=0.4;

height = 15;
support_width = 10;
cutter_width = nozzle_size*2;
 

cutter();     

module cutter(){
    edge(nozzle_size*3,support_width,0);
    edge(nozzle_size*7,cutter_width,0);
    edge(height,0,-nozzle_size*1);
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
    
    rotate([0,180,0])
    scale([0.3,0.3,1])
    import("hedgehog.svg",center=true);
}

