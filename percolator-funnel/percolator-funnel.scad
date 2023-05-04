$fn=128;

r_inner=88/2;
h_inner=20;
wall = 1.4;

r_cap=(14)/2;
d_cap=8;

h_funnel=10;

r_support=3;

difference(){
    difference(){
        union(){
            translate([0,0,(h_inner-d_cap)])
                sphere(r_cap);
            cylinder(h=h_inner-d_cap, r=r_cap, center=false);
            
            for (rz = [-120, 0, 120]){
                rotate([90,0,rz])
                    cylinder(r_inner-wall,r_support,r_support);
            }
        }
        cylinder(h=h_inner-d_cap, r=r_cap-wall, center=false);
    }
    
    translate([0,0,-h_inner])
        cylinder(h=h_inner,r=r_inner, center=false);
}

difference(){
    cylinder(h=h_inner,r=r_inner, center=false);
    cylinder(h=h_inner+1,r=r_inner-wall, center=false);
}

translate([0,0,h_inner])
    difference(){
        cylinder(h=h_funnel,r1=r_inner, r2=r_inner+h_funnel*2, center=false);
        cylinder(h=h_funnel,r1=r_inner-wall, r2=r_inner+h_funnel*2-wall, center=false);
    }
