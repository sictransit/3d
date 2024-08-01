$fn=128;

nozzle_size=0.4;

height = 10;
scaling=0.081;

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
        translate([-3.9,7.5,0])
        difference(){
            cylinder(height,12,12);
            translate([0,0,-height/2])
                cylinder(height*2,9.10,9.10);
        }
        translate([-15,-6,0])
        cube([25,10,height]);
        translate([-17,0,0])
        cube([10,20,height]);
        translate([-7,14,-16])
        sphere(20);
        translate([-7,14,26])
        #sphere(20);

    }
    
}

module support(){
    translate([-24.7,3.05,0])
    cube([30,2,height]);
    
    translate([5.2,2,0])
    cube([2.9,5,height]);
    
    translate([0,1.9,0])
    cube([8.1,2,height]);
}