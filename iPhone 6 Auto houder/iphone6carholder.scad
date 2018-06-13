$fn=100;

iphone_width=75; //67.5;
iphone_height=139;
iphone_depth=9; // 7.5;
connector_width = 15; // 35;

distance_between_screws=38;
screw_head = 7;
screw_hole = 4;

walls=1.2;

backplate_depth=5;

module iphone6andwalls(){
  center_depth=1;
  iphone_width=iphone_width+(2*walls);
  iphone_height=iphone_height+(2*walls);
  iphone_depth=iphone_depth+(2*walls);
  sphere_diameter=iphone_depth-center_depth;
  
  translate([sphere_diameter/2,sphere_diameter/2,sphere_diameter/2]){
    minkowski(){
      cube([iphone_width-sphere_diameter,iphone_height-sphere_diameter,center_depth]);
      sphere(d=sphere_diameter);
    }
  }    
}

module iphone6_cutout(){

  
  center_depth=1;
  sphere_diameter=iphone_depth-center_depth;
  
  translate([sphere_diameter/2,sphere_diameter/2,sphere_diameter/2]){
    minkowski(){
      cube([iphone_width-sphere_diameter,iphone_height-sphere_diameter,center_depth]);
      sphere(d=sphere_diameter);
    }
    translate([0,0,iphone_depth-(sphere_diameter)]){
      cube([iphone_width-sphere_diameter,iphone_height-sphere_diameter,iphone_depth]);
    }  
  }
  translate([(iphone_width-connector_width)/2,sphere_diameter-connector_width,-iphone_depth]){
    cube([connector_width,connector_width,iphone_depth*3]);
  }    
}

module brodit_cutter(){
  translate([0,0,-backplate_depth/2]){
    cylinder(d=screw_hole, h=backplate_depth*2);
    translate([0,0,backplate_depth])
      cylinder(d=screw_head, h=backplate_depth);
    translate([0,distance_between_screws,0]){
      cylinder(d=screw_hole, h=backplate_depth*2);
      translate([0,0,backplate_depth])
        cylinder(d=screw_head, h=backplate_depth);      
    }
    translate([0,distance_between_screws/2,0]){
      cylinder(d=screw_head, h=backplate_depth*2);  
    }
  }
}



outer_sphere = iphone_depth+(2*walls);
difference(){
  union(){
    /*
    translate([0,0,backplate_depth-walls]){
      iphone6andwalls();
    }
    */
    translate([outer_sphere/2,outer_sphere/2,outer_sphere/2]){
      minkowski(){
        cube([iphone_width+(walls*2)-outer_sphere, iphone_height, (iphone_depth+backplate_depth+walls)-outer_sphere]);
        sphere(d=outer_sphere);
      }
    }
  }
  translate([walls, walls, backplate_depth]){
    iphone6_cutout();
  }
  translate([iphone_width/2,(iphone_height/2)-(distance_between_screws+screw_head),0]){
    brodit_cutter();
  }
  translate([0,iphone_height/2,0]){
    cube([iphone_width*2, iphone_height, iphone_depth*5]);
  }
}