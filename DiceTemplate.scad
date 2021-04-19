$fa=1;
$fs=0.4;
use <MCAD/math.scad>

oddDice(sides=13, radius=10, has_text=true);

module oddDice(sides, radius=10, has_text=true, font) { 
     //points, in theta, phi in radians, text, rotation of text in deg
    points = [];
    slice_depth = 0;
    emboss_depth = 0;
    font_size = 0;
    
    if(sides == 3) {
        // 3 sided
        slice_depth=radius/2+1.5;
        emboss_depth=2;
        font_size=6;
        points = [
            [1.1869998454816448, 2.0634762342718203, "1", -65],
            [2.9470510242730503, 0.40601741219123333, "2", 175],
            [-1.5064146743590998, 2.0327661495897162, "3", -120],
        ];
        drawDie(radius, points, slice_depth, emboss_depth, has_text, font_size, font);
    }

    if(sides == 5) {
        // 5 sided
        slice_depth=radius/2;
        emboss_depth=slice_depth+1;
        font_size=6;
        points = [
            [-1.9439610875389723, 2.201163510863805, "1", 20],
            [-1.3619256384975995, 0.7179817700100568, "2", 25],
            [2.6774431652054163, 1.6946785280169987, "3", -55],
            [0.25946549852085743, 2.2517950571651215, "4", 40],
            [1.1976316463087568, 0.9404292894245657, "5", -15],
        ];
        drawDie(radius, points, slice_depth, emboss_depth, has_text, font_size, font);
        
    }
    if(sides == 7) {

        // 7 sided
        slice_depth=radius/3;
        emboss_depth=slice_depth+1;
        font_size=6;
        points = [
            [-1.4032814180067374, 1.8270327101541302, "1", 0],
            [-2.797003824452471, 0.6320062408324842, "2", 100],
            [-0.38303622891067574, 0.7423401612170204, "3", -130],
            [-3.0235802430241536, 1.9053864886020455, "4", -75],
            [0.4303403154908303, 1.7750593584144774, "6", -120],
            [1.3753909809898046, 2.9786540077597747, "5", 200],
            [1.79271711769602, 1.3403931463360323, "7", 0],
        ];
        drawDie(radius, points, slice_depth, emboss_depth, has_text, font_size, font);
    }
    if(sides == 9) {
        // 9 sided -- TODO fix rotations and tune values
        slice_depth=radius/4;
        emboss_depth=slice_depth+1;
        font_size=6;
        points = [
            [-0.21021831924441833, 1.0920332262149022, "1", 90],
            [-2.0911544239493187, 0.3113429361460962, "2", 110],
            [-0.7382255516352262, 2.1917299714349063, "3", -25],
            [-1.802439953320191, 1.5050613271693272, "4", 60],
            [1.4176353507303758, 0.9131965311875305, "5", -105],
            [2.07557963488994, 1.9499292004576199, "6.", 20],
            [-3.137739461702496, 1.352840512820339, "7", -50],
            [0.7250261577169067, 2.0707966545465126, "8", -5],
            [-2.7076821516949794, 2.6350143829805774, "9.", 20],
        ];
        drawDie(radius, points, slice_depth, emboss_depth, has_text, font_size, font);
    }
    if(sides == 11) {

        // 11 sided
        slice_depth=radius/5;
        emboss_depth=slice_depth+1;
        font_size=5;
        points = [
            [-2.8691407645411378, 1.2623934264045644, "1", 45],
            [2.2018109703578377, 0.40645884788718034, "2", 0],
            [0.6844916726321627, 0.9916869207420755, "3", 25],
            [-1.4009941653648559, 0.6665306086807135, "4", 45],
            [2.1239391137672534, 1.4487660226442562, "5", -50],
            [-0.7215158088545749, 1.500459448018647, "7", -50],
            [-1.889078191146362, 1.7836030902179691, "6.", 55],
            [1.417285797246207, 2.206774387902258, "8", -25],
            [3.0388115840318437, 2.305174303085015, "9.", -85],
            [-1.0728276079261563, 2.7427851763893454, "10", 90],
            [0.24964253030831943, 1.9272400266757201, "11", 45],
        ];
        drawDie(radius, points, slice_depth, emboss_depth, has_text, font_size, font);
    }
    if(sides == 13) {

        // 13 sided
        slice_depth=radius/5;
        emboss_depth=slice_depth+1;
        font_size=5;
        points = [
            [-1.087297071958153, 1.4794941343781716, "1", 0],
            [-0.28372032519249724, 2.1094980109417367, "2", 180],
            [-0.021333743922701733, 1.0870722012966167, "3", 60],
            [-1.7289346089939892, 2.425728995368771, "4", 0],
            [-2.086030364896862, 1.376532717699742, "5", -135],
            [1.3564756041798605, 0.6775170410958481, "6.", 0],
            [-1.4288734917494486, 0.42358618065924714, "7", 0],
            [2.7175582820065953, 2.4970074871229766, "8", -45],
            [0.9668946806334855, 2.558388218067544, "9.", 180],
            [0.9347940215120581, 1.6029904134239614, "10", 165],
            [-2.986850835726956, 1.708571484669478, "11", 25],
            [2.880761163971836, 0.8313514535607519, "12", -5],
            [2.0310735812939136, 1.6148502869813102, "13", 0],
        ];
        drawDie(radius, points, slice_depth, emboss_depth, has_text, font_size, font);
        
    }

    toXYZ = function(theta, phi)
        [
            radius * sin(deg(phi)) * cos(deg(theta)),
            radius * sin(deg(phi)) * sin(deg(theta)),
            radius * cos(deg(phi))
        ];
     
    
    module drawDie(radius, points, slice_depth, emboss_depth, has_text, font_size, font) {
        
        difference() {
            sphere(r=radius);
            
            for(i=[0:1:len(points)-1]) {
                position = toXYZ(points[i][0], points[i][1]);
                textPoint = [points[i][0], points[i][1] + PI];
                textPosition = toXYZ(textPoint[0], textPoint[1]);
                
                sphereNormal(position) cylinder(h=slice_depth,r=radius, center=true);
            
                if(has_text) {
                    sphereNormal(textPosition) rotate([0,0,points[i][3]]) linear_extrude(height=emboss_depth, center=true) text(points[i][2], size=font_size, font=font, halign="center", valign="center");
                }
            }
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
    };
};