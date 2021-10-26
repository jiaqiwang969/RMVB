SetFactory("OpenCASCADE");

// parameter
x1= 0.41;
x2=0.54;
x3=0.3;
x4=0.1;
x5=0.47;
R1=0.3;
R2=0.6;
mic1=0.26;
mic2=0.2;


angle = Pi*2;
radiusOut = 0.3;
crop = 18;
radiusIn = crop/100*radiusOut;
height = 1.82;

// Build geometry

extWall = newv;
Cylinder(extWall) = {0, 0, 0, 0, 0, height, radiusOut, angle};
inWall = newv;
Box(inWall) = {-1, -1, 0, 2*1, 2*1, height};
vWall = newv;
Sphere(vWall) = {0, 0, height, R2, -Pi/2, Pi/2, 2*Pi};
wWall = newv;
BooleanDifference(wWall) = { Volume{vWall}; Delete; }{ Volume{inWall}; Delete; };


//+
BooleanUnion{ Volume{1}; Delete; }{ Volume{19}; Delete; }


//+
Physical Surface("Absorbing", 7) = {1};
//+
Physical Surface("Absorbing", 7) += {2};
//+
Physical Surface("Reflecting", 8) = {3};
//+
Physical Surface("Absorbing", 7) += {4};
//+
Physical Volume("Domain", 9) = {1};
