$fn=60;

Vml = 15;
Vmm3 = Vml*1000;
wall = 0.8;

 r  = pow( Vmm3 *1.5/PI,1/3);
 r_outer = r+2*wall;

difference()
{
measuring_cup();    
    hole();
}


module measuring_cup()
{
    difference()
{
union(){

hull(){
    handle();
    support();}

difference(){
    
hull()
{
    outside();
    support();    
}


cutout();
inside();
}


}
label();
}
 }

module support()
{
    translate([r_outer,-wall*2,wall])
cube(wall*4);
}

module hole()
{
     translate([r_outer*3.2,0,0])
 {cylinder(h=r, r= 2.5, center=true);}
}

    


module handle()
{
 union(){   
    translate([r_outer-wall*2,-r/4,0])
cube([r*2.5,r/2,wall]);
    
    translate([r*3.5,0,0])
    cylinder(h=wall, r=r/4);
 }
    
    }

module cutout()
{
    translate([-r_outer,-r_outer,-r_outer]){
cube([r_outer*4,r_outer*2,r_outer]);
}}

module outside()
{
    sphere(r+2*wall);}

module inside()
    {
sphere(r);
        }


module label(){
    rotate([180,0,0])
    translate([r_outer*1,-r/8,-wall])
            linear_extrude(wall*2)

            text(str(str(Vml), " ml (cm³)"),halign="left", size=6, font="Segoi UI Semibold");
        }
