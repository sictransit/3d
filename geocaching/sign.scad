$fn=40;

w=95;
d=35;
h=5;

r=2.5;
r1 = 5.25;

difference() {
cube([w,d,h]);

translate([3+r,5+r,-h/2])
    cylinder(h*2,r,r);
translate([w-(3+r),d-(5+r),-h/2])
    cylinder(h*2,r,r);
translate([w-(3+r),(5+r),-h/2])
    cylinder(h*2,r,r);
translate([(3+r),d-(5+r),-h/2])
    cylinder(h*2,r,r);

translate([15.7+r1,d/2,-h/2])
    cylinder(h,r1,r1);
translate([w-(15.7+r1),d/2,-h/2])
    cylinder(h,r1,r1);
translate([9,d-10,h-1])
linear_extrude(height=1, convexity=4)
    text("BERGSBRUNNA",size=label_size,font=font_name );
}

font_name="Saira Stencil One:style=Bold";
label_size=8.5;


translate([10,3,h])
linear_extrude(height=1, convexity=4)
    text("Δφ +42 Δλ -94",size=label_size,font="Arial" );

translate([27.5,14,h])
linear_extrude(height=1, convexity=4)
    text("GC9F6GJ",size=label_size,font=font_name );
