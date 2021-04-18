width=1.6;
height=12;
length=175;
label_length = 80;

// https://fonts.google.com/share?selection.family=Alegreya%20Sans%20SC
font_name="Alegreya Sans SC:style=Regular";

label_text="Carolina Reaper";
label_margin=1;
label_size=height-width-label_margin*2;

svg();

module svg() {
    translate([-4,4.75,0])
    linear_extrude(height=width*1.5) {    
        rotate([0,0,97])    
        scale([4,4,0])    
        import("chili.svg", center=true);
    }
}

hull(){
    cube([length-2*height,width,width*2]);
    translate([length-width,0,0])
    cube([width,width,width]);
}


    hull() {
        translate([0,-height+width,0])
        cube([label_length,height,width]);
        translate([length-width,0,0])
        cube([width,width,width]);
    }
    
    #translate([label_margin,-height/2+label_margin,width/2])
    linear_extrude(height=width, convexity=4)
    text(label_text,size=label_size,font=font_name, valign= "center");



