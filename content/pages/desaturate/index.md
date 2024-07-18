---
title: "SV Control: Desaturating Reaction Wheels in the Satellite Simulator"
date: "2024-07-18"
draft: true
---

Background: my professor for Space Vehicle control (Dr. Eric Swenson) wrote an incredible satellite dynamics simulator in MATLAB. Assignments for the class provided a specific end condition of the vehicle, and we wrote code that controls the simulator. A big part of it was representing the rotation from initial to final attitude; I liked to use Euler axis/angle, DCMs, and dot/cross products depending on the situation. Below is my favorite problem out of all the assignments

## Objective

As shown below, the objective for this problem is to point the SV body axes at \\\(\langle 1,1,1 \rangle\frac{1}{\sqrt 3} \\\) in the inertial frame. There is a disturbance torque on the vehicle, which increases angular momentum until the reaction wheels saturate at 5000 RPM; the main challenge is to write code to desaturate the wheels by dumping angular momentum using external torques from the thrusters. 

{{< figure alt="initial attitude of satellite with parameters" src="Initial-attitude.png" caption="Initial attitude of space vehicle \\\(\langle 1,1,1 \rangle\_i \\\)" >}}

{{< figure alt="final attitude of satellite with parameters" src="final-attitude.png" caption="Final attitude of space vehicle \\\(\frac{1}{\sqrt 3}\langle 1,1,1 \rangle_i \\\)" >}}

## Interesting Code Snippets

### Commanded attitude 

Computes the final attitude by crossing the body axes into the target vector, converting to euler angle/axis, then a direction cosine matrix multiplied by an extra 3-rotation, then a quaternion, which ultimately becomes the transmuted quaternion matrix for simulator input. 

{{< highlight matlab >}}

%% FINAL COMMANDED ATTITUDE via a rotation matrix and quaternions
target = [ 1 1 1 ]/sqrt(3);
b3_i= [0 0 1];

% Quaternion pointed at target
a1 = cross(b3_i, target)';
a1=a1/norm(a1);
phi = acos(dot(b3_i, target)/(norm(b3_i)*norm(target)));
[~,~, R_target, ~] = Q2R([a1*sin(phi/2); cos(phi/2)]);

% Additional 3-rotation
theta_1 = deg2rad(220);
R_3_1 = [ cos(theta_1) -sin(theta_1)
0
R_bi = R_3_1*R_target;
sin(theta_1)
cos(theta_1)
0
0 ;
0
;
1];

% Transmuted Quaternion Matrix
M_tilde = [ q_commanded(4) -q_commanded(3) q_commanded(2) q_commanded(1)
q_commanded(3) q_commanded(4) -q_commanded(1) q_commanded(2)
-q_commanded(2) q_commanded(1) q_commanded(4) q_commanded(3)
-q_commanded(1) -q_commanded(2) -q_commanded(3) q_commanded(4) ];
M_tilde_inv = inv(M_tilde);

{{< / highlight >}}