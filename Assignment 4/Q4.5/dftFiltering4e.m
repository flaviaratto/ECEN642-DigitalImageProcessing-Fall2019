function g = dftFiltering4e(f,H,padmode,scaling)
[m,n]=size(f); %Obtaining padding sizes

%Padding
if padmode=="replicate"
    fp= padarray(f,[m,n],'replicate','post');
end
if padmode==""
    fp= padarray(f,[m,n],'replicate','post');
end
if padmode=="zeros"
    fp= padarray(f,[m,n],0,'post');
end

if padmode=="none"
    fp= f;
end

%Centering the image
fp_centered = minusOne4e(fp);

%Computing DFT
fp_DFT=fft2(fp_centered);

%Multiplying the above image with the real symmetric transfer function
H=real(H);
G=fp_DFT.*H;

%Computing IDFT of G
gp=ifft2(G);
gp=real(gp);

%Decentering
gp_dc=minusOne4e(gp);

%Stripping the padding
g1=gp_dc(1:m,1:n);

%Output scaling
if scaling=="yes"
    g=intScaling4e(g1,"full","floating");
end

if scaling=="no"
    g=g1;
end
    
if scaling==""
    g=g1;
end
    