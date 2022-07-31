
$fn=40;
md=-0.4;

difference()
{
difference(){
scale(1)
    {
import(file="Hex_Queen.stl");
    }    
translate([0,15/2,10])
    rotate([90,0,0])
#cylinder(15,6,6);   
   translate([10,md,5]) 
    #magnet();
   translate([-10,md,5]) 
    #magnet();
   translate([0,md,65/2+5]) 
    #magnet();
   translate([0,md,70]) 
    #magnet();
    
}
translate([-50,0,-10])
cube([100,100,100]);
}



module magnet()
{
rotate([90,0,0])
cylinder(h=1.2,r=1.2);
}