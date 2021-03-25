$fn=120;

Vml = 15;
Vmm3 = Vml*1000;
wall = 0.8;

r = pow( Vmm3 *1.5/PI,1/3);
r_outer = r+2*wall;

handle_attach = r_outer-wall*2;
handle_length = 60;
handle_width = 15;
handle_text = "(msk)";

difference() {
    measuring_cup();    
    hole();
}


module measuring_cup() {
    difference() {
        union() {
            hull() {
                handle();
                support();
                }
                difference() {
                    hull() {
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
cube(wall*3);
}

module hole()
{
     translate([handle_length +handle_attach ,0,0])
 {cylinder(h=r, r= 2.5, center=true);}
}

    


module handle()
{
 union(){   
     
     
    translate([handle_attach ,-handle_width /2,0])
cube([handle_length ,handle_width,wall*1.5]);
    
    translate([handle_length +handle_attach ,0,0])
    cylinder(h=wall*1.5, r=handle_width /2);
 }
    
    }

module cutout()
{
    translate([-r_outer,-r_outer,-r_outer]){
cube([r_outer*3,r_outer*2,r_outer]);
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
    translate([r_outer+wall,0,-wall])
            linear_extrude(wall*2)

            text(str(str(Vml), " ml ", handle_text),valign="center",halign="left", size=6, font="Segoe UI Semibold");
        }
