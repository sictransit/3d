$fn=164;

nozzle_size=0.4;

height = 10;
scaling=0.082;

//minkowski()
main();     
hook();
support();

module main(){
    translate([-9.86,0,0])
    {
        linear_extrude(height){
            scale([scaling, scaling, scaling])
            import("hook.svg",center=true);
        }
    }    
    
}

module hook(){
    difference()
    {
        translate([0.45,7.5,0])
        difference(){
            cylinder(height,7.65,7.65);
            translate([0,0,-height/2])
                cylinder(height*2,4.75,4.75);
        }
        translate([0,-1,0])
        cube([10,5,height]);
        translate([-10,0,0])
        cube([10,20,height]);
    }
    
    difference()
    {
        translate([0,15.15,5])
            rotate([90,90,0])    
                cylinder(2.9,5,5);
        translate([0,10,0])
            cube([10,10,height]);
    }
}

module support(){
    translate([-24.85,3.05,0])
    cube([30,2,height]);
    
    translate([5.2,2,0])
    cube([2.9,5,height]);
    
    translate([0,1.9,0])
    #cube([8.1,2,height]);
}