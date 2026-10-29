// ================= LED Strip Clip =================
// Arch clip with a small side mounting lip.
// Nail goes vertically through the lip.
//
// No base plate.
// No retaining lips.

strip_w     = 12.5;
strip_h_min = 1.7;
strip_h_max = 2.5;

tol = 0.25;

wall     = 1.8;
clip_len = 10;

// Side mounting lip
lip_w = 5;      // extension from clip
lip_t = 2;      // thickness
lip_l = 6;      // length along strip

// Nail hole
nail_d = 1.5;

$fn = 64;

// ---- Derived ----
pocket_w    = strip_w + tol;
pocket_hmin = strip_h_min + tol/2;
pocket_hmax = strip_h_max + tol/2;

outer_w    = pocket_w + 2*wall;
outer_hmin = pocket_hmin + wall;
outer_hmax = pocket_hmax + wall;

// ---- Dome profile ----
module dome_2d(w, hmin, hmax) {
    union() {
        translate([-w/2,0])
            square([w,hmin]);

        translate([0,hmin])
            intersection() {
                scale([w/2,hmax-hmin])
                    circle(r=1);

                translate([-w/2-1,0])
                    square([w+2,hmax-hmin]);
            }
    }
}

// ---- Side lip ----
module side_lip() {
    overlap = 0.8;

    translate([
        outer_w/2 - overlap,
        0,
        -strip_h_min-tol-.05-lip_t*0.5
    ])
        cube([lip_w + overlap, clip_len , lip_t*1.5]);
}

// ---- Nail hole ----
module nail_hole() {
    translate([
        outer_w/2 + lip_w/2,
        clip_len/2,
        -strip_h_min-tol-.05-lip_t*0.5
    ])
        cylinder(
            d = nail_d,
            h = 100
        );
}

difference() {
    union() {
        // Arch
        
        difference() {
            rotate([-90,0,0])
                linear_extrude(height=clip_len)
                    dome_2d(
                        outer_w,
                        outer_hmin,
                        outer_hmax
                    );

            translate([0,-1,0])
                rotate([-90,0,0])
                    linear_extrude(height=clip_len+2)
                        dome_2d(
                            pocket_w,
                            pocket_hmin,
                            pocket_hmax
                        );
        }

        side_lip();
    }

    nail_hole();
}
