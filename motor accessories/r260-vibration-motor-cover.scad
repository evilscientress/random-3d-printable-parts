// configuration
$fn=50;
outer_dia = 26.5;
cap_thickness = 1.2;

inner_ledge_dia = 18.8 + 0.4;
inner_ledge_length = 4;
motor_dia = 23.8;
motor_lenght = 37;
motor_lenght_b = 23.5 + 0.5;
mass_spacing = 2; // distance between the inside of the cover and the rotating mass
retention_ledge = 0.8;

// calculated values
inner_dia = motor_dia + 0.6;
retention_ledge_dia = motor_dia - retention_ledge;
total_height = motor_lenght + mass_spacing + retention_ledge + cap_thickness;
inner_ledge_chamfer_height = (inner_dia - inner_ledge_dia) / 2;

// geometry
union() {
    // outer shell
    difference() {
        cylinder(h=total_height, d=outer_dia, center=false);
        translate([0, 0, cap_thickness])
        cylinder(h=total_height - retention_ledge - cap_thickness, d=inner_dia, center=false);
        // retention ledge
        translate([0, 0, total_height - retention_ledge])
        cylinder(d1=inner_dia, d2=retention_ledge_dia, h=retention_ledge);
    }
    // inner ledge
    translate([0, 0, total_height - retention_ledge - motor_lenght_b - inner_ledge_length]) difference() {
        cylinder(d=inner_dia, h=inner_ledge_length);
        translate([0, 0, -.1]) cylinder(h=inner_ledge_length + 0.2, d=inner_ledge_dia);
        cylinder(d1=inner_dia, d2=inner_ledge_dia, h=inner_ledge_chamfer_height);
    }
}