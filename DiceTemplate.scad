$fa=1;
$fs=0.4;
use <MCAD/math.scad>
radius=10 ;
slice_depth=radius/3;
//points, in theta, phi in radians
// 5 sided
points = [
    [-1.3619256384975995, 0.7179817700100568],
    [2.6774431652054163, 1.6946785280169987],
    [-1.9439610875389723, 2.201163510863805],
    [1.1976316463087568, 0.9404292894245657],
    [0.25946549852085743, 2.2517950571651215]
];
// 7 sided
//points = [
//    [1.0393585990386534, 1.456492084934532],
//    [2.2188491464172913, 2.483565876999961],
//    [-2.8236149768343575, 1.4833644905550065],
//    [2.2634020482629897, 0.6953755370582009],
//    [-0.9358816891504483, 0.7161758024433014],
//    [-1.638882548289906, 2.087928022124956],
//    [-0.14361248362855517, 2.022930731866264]
//];

// 9 sided
//points = [
//    [-0.7382255516352262, 2.1917299714349063],
//    [-3.137739461702496, 1.352840512820339],
//    [2.07557963488994, 1.9499292004576199],
//    [0.7250261577169067, 2.0707966545465126],
//    [-0.21021831924441833, 1.0920332262149022],
//    [1.4176353507303758, 0.9131965311875305],
//    [-1.802439953320191, 1.5050613271693272],
//    [-2.0911544239493187, 0.3113429361460962],
//    [-2.7076821516949794, 2.6350143829805774],
//];

toXYZ = function(theta, phi)
    [
        radius * sin(deg(phi)) * cos(deg(theta)),
        radius * sin(deg(phi)) * sin(deg(theta)),
        radius * cos(deg(phi))
    ];
 
difference() {
    sphere(r=radius);
    
    for(i=[0:1:len(points)-1]) {
        position = toXYZ(points[i][0], points[i][1]);
        textPoint = [points[i][0], points[i][1] + PI];
        textPosition = toXYZ(textPoint[0], textPoint[1]);
        
        sphereNormal(position) cylinder(h=slice_depth,r=radius, center=true);
        
        sphereNormal(textPosition) translate([-3, -3,0]) linear_extrude(height=slice_depth+1, center=true) text(str(i+1), size=6);
    }
}


module sphereNormal(position) {
    a = [0,0,0];
    b = position;
    dir = b - a;
    h = norm(dir);
    if(dir[0] == 0 && dir[1] == 0) {
        //no rotation necessary
        translate(position) children();
    }
    else {
        w  = dir / h;
        u0 = cross(w, [0,0,1]);
        u  = u0 / norm(u0);
        v0 = cross(w, u);
        v  = v0 / norm(v0);
        translate(position)
            multmatrix(m=[[u[0], v[0], w[0], a[0]],
                  [u[1], v[1], w[1], a[1]],
                  [u[2], v[2], w[2], a[2]],
                  [0,    0,    0,    1]])
                children();
    }
}